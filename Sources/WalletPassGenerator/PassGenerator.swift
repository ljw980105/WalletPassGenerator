import Foundation
import ShellOut

public struct PassGenerator {
    /// Generate a pass. Note the certificates and the assets should already be located at the url provided before this method is called
    /// - Parameters:
    ///   - pass: the pass you want to generate
    ///   - url: where you want the pass to appear
    ///   - certificateName: p12 certificate. See how to generate one at https://www.raywenderlich.com/2855-beginning-passbook-in-ios-6-part-1-2#toc-anchor-007
    ///   - wwdrCertificateName: name of the Apple Worldwide Developer Relations certificate, format should be `.pem`
    ///   - assets: Names of the asset files
    ///   - name: Name of the pass, should end with extension .pkpass
    /// - Throws: Error
    /// - Returns: The pkpass file
    /// - Note: This method blocks the thread until the pass is fully generated. It's fully synchronous
    @discardableResult
    public static func generatePass(
        _ pass: Pass,
        named name: String,
        at url: URL,
        certificateName: String,
        wwdrCertificateName: String,
        assets: [String]
    ) throws -> Data? {
        let fileURL = URL(fileURLWithPath: url.absoluteString)
        // generate pass.json
        let jsonEncoder = JSONEncoder()
        let data = try jsonEncoder.encode(pass)
        try data.write(to: fileURL.appendingPathComponent("pass.json"))
        
        // generate manifest.json
        var manifest: [String: String] = [:]
        for asset in assets + ["pass.json"] {
            manifest[asset] = try ShellOutCommand.getSHA1ChecksumForFile(
                named: asset,
                at: url.absoluteString
            )
        }
        let json = try JSONSerialization.data(withJSONObject: manifest, options: [])
        try json.write(to: fileURL.appendingPathComponent("manifest.json"))
        
        // generate additional certificates
        // generate passcertificate.pem
        try shellOut(
            to: "openssl pkcs12 -in \(certificateName) -clcerts -nokeys -out passcertificate.pem -passin pass:",
            at: url.absoluteString
        )
        // generate passkey.pem
        try shellOut(
            to: "openssl pkcs12 -in \(certificateName) -nocerts -out passkey.pem -passin pass: -passout pass:12345",
            at: url.absoluteString
        )
        
        // generate signature with WWDR
        try shellOut(
            to: "openssl smime -binary -sign -certfile \(wwdrCertificateName) -signer passcertificate.pem -inkey passkey.pem -in manifest.json -out signature -outform DER -passin pass:12345",
            at: url.absoluteString
        )
        
        // create final zip file (.pkpass)
        try shellOut(
            to: "zip -r \(name) manifest.json pass.json signature \(assets.joined(separator: " "))",
            at: url.absoluteString
        )
        
        let finalUrl = fileURL.appendingPathComponent(name)
        return try Data(contentsOf: finalUrl)
    }
    
    
}
