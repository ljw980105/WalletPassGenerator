//
//  PassBarcode.swift
//  
//
//  Created by Jing Wei Li on 5/26/21.
//

import Foundation

public struct PassBarcode: Codable {
    public let message: String
    public let format: String
    public let messageEncoding: String
    
    public init(
        message: String,
        format: PassBarcodeFormat,
        encoding: PassBarcodeEncoding
    ) {
        self.message = message
        self.format = format.rawValue
        self.messageEncoding = encoding.rawValue
    }
}

public enum PassBarcodeFormat: String {
    case pdf417 = "PKBarcodeFormatPDF417"
}

public enum PassBarcodeEncoding: String {
    case iso_8859_1 = "iso-8859-1"
}
