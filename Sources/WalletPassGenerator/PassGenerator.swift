import Foundation
import ShellOut
import ZIPFoundation

public struct PassGenerator {
    /// Generate a pass. Note the certificates and the assets should already be located at the url provided before this method is called
    /// - Parameters:
    ///   - pass: the path you want to generate
    ///   - url: the where you want the pass to appear
    ///   - certificateName: p12 certificate
    ///   - wwdrCertificateName: name of the Apple Worldwide Developer Relations certificate, format should be `.pem`
    ///   - assets: Names of the asset files
    ///   - named: Name of the pass, should end with extension .pkpass
    /// - Throws: Error
    public static func generatePass(
        _ pass: Pass,
        named name: String,
        at url: URL,
        certificateName: String,
        wwdrCertificateName: String,
        assets: [String]
    ) throws {
        let fileURL = URL(fileURLWithPath: url.absoluteString)
        // generate pass.json
        let jsonEncoder = JSONEncoder()
        let data = try jsonEncoder.encode(pass)
        try data.write(to: fileURL.appendingPathComponent("pass.json"))
        
        // generate manifest.json
        var manifest = "{"
        manifest += try assets
            .map { assetName in
                "\"\(assetName)\": \"\(try ShellOutCommand.getSHA1ChecksumForFile(named: assetName, at: url.absoluteString))\""
            }
            .joined(separator: ", ")
        manifest += ",\"pass.json\":\"\(try ShellOutCommand.getSHA1ChecksumForFile(named: "pass.json", at: url.absoluteString))\""
        manifest += "}"
        try manifest.write(
            to: fileURL.appendingPathComponent("manifest.json"),
            atomically: true,
            encoding: .utf8
        )
        
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
    }
    
    
}
