# WalletPassGenerator

Swift Package to generate a pass for Apple Wallet. This package is essentially an automated swift script of creating a wallet pass using the process described in this awesome [Ray Wenderlich Article](https://www.raywenderlich.com/2855-beginning-passbook-in-ios-6-part-1-2)

Notice that this package at the moment only supports macOS and Linux (when using a framework such as Vapor). **Running this package on iOS is not supported**.

## Installation:

TBD

* When running on linux, make sure the command line tools  `openssl` and `zip` are installed.

## Usage Guide

### Creating a class representing the pass:
```Swift
import Foundation
import WalletPassGenerator

let pass = Pass(
    formatVersion: 1,
    passTypeIdentifier: ".......", // the same identifier used to create the certificate
    serialNumber: "abcdefg",
    teamIdentifier: ".......", // TeamID of your apple developer account,
    organizationName: "My Organization",
    description: "Description",
    logoText: "",
    foregroundColor: .rgb(r: 0, g: 0, b: 0),
    backgroundColor: .rgb(r: 255, g: 255, b: 255),
    labelColor: .rgb(r: 20, g: 85, b: 161),
    barcodes: [],
    eventTicket: .init(...) // initalize a event ticket here
)
```
* The last parameter represents the type of pass to generate. There are 5 types of passes:
    * `eventTicket`
    * `coupon`
    * `boardingPass`
    * `storeCard`
    * `genericPass`.
* Fill in the desired parameter for the type of pass you're generating.

### Generate the pass:
```swift
import Foundation
import WalletPassGenerator

try PassGenerator.generatePass(
    pass,
    named: "pass.pkpass",
    at: URL(string: FileManager.default.currentDirectoryPath + "/TestPass1/")!,
    certificateName: "Certificates.p12",
    wwdrCertificateName: "WWDR.pem",
    assets: [
        "logo.png",
        "logo@2x.png",
        "strip.png",
        "strip@2x.png",
        "icon.png",
        "icon@2x.png",
    ]
)
```
* Explaining each parameter:
    * `pass`: The pass object to generate the pass from
    * `named`: The name of the pass. The name should have a file extension `.pkpass`
    * `url`:  The url where the final pass should appear in. **Note the certificates and the assets should already be located at this url before this method is called**.
    * `certificateName`: The certificate you created on the Apple Developer Portal with passKit as one of its capabilities, exported in the p12 format.  See [this article](https://www.raywenderlich.com/2855-beginning-passbook-in-ios-6-part-1-2#toc-anchor-007) for how to create one.
    * `wwdrCertificateName`: The pem certificate for Apple Worldwide Developer Relations. See [this](https://www.raywenderlich.com/2855-beginning-passbook-in-ios-6-part-1-2#toc-anchor-011) for how to get one.
    * `assets`: The file names of assets (excluding `pass.json`, `manifest.json` and `signature`). See [this](https://www.raywenderlich.com/2855-beginning-passbook-in-ios-6-part-1-2#toc-anchor-005) for all possible assets to provide.
    
* After calling this method, a `.pkpass` file should appear at the given url.


### Thanks for stopping by!


