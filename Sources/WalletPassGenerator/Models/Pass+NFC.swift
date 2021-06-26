//
//  Pass+NFC.swift
//  
//
//  Created by Jing Wei Li on 6/26/21.
//

import Foundation

public extension Pass {
    struct NFC: Codable {
        public let encryptionPublicKey: String
        public let message: String
        public let requiresAuthentication: Bool?
        
        public init(
            encryptionPublicKey: String,
            message: String,
            requiresAuthentication: Bool? = nil
        ) {
            self.encryptionPublicKey = encryptionPublicKey
            self.message = message
            self.requiresAuthentication = requiresAuthentication
        }
    }
}
