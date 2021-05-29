//
//  PassBarcode.swift
//  
//
//  Created by Jing Wei Li on 5/26/21.
//

import Foundation

/// https://developer.apple.com/documentation/walletpasses/pass/barcodes
public struct PassBarcode: Codable {
    public let message: String
    public let format: PassBarcodeFormat
    public let messageEncoding: PassBarcodeEncoding
    public let altText: String?
    
    public init(
        message: String,
        format: PassBarcodeFormat,
        encoding: PassBarcodeEncoding = .iso_8859_1,
        altText: String? = nil
    ) {
        self.message = message
        self.format = format
        self.messageEncoding = encoding
        self.altText = altText
    }
}

public enum PassBarcodeFormat: String, Codable {
    case pdf417 = "PKBarcodeFormatPDF417"
    case qr = "PKBarcodeFormatQR"
    case aztec = "PKBarcodeFormatAztec"
}

public enum PassBarcodeEncoding: String, Codable {
    case iso_8859_1 = "iso-8859-1"
}
