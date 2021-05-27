//
//  File.swift
//  
//
//  Created by Jing Wei Li on 5/26/21.
//

import Foundation

public struct Coupon: Codable {
    public let primaryFields: [PrimaryField]
    
    public init(primaryFields: [PrimaryField]) {
        self.primaryFields = primaryFields
    }
}

public extension Coupon {
    struct PrimaryField: Codable {
        let key: String
        let label: String
        let value: String
        
        public init(key: String, label: String, value: String) {
            self.key = key
            self.label = label
            self.value = value
        }
    }
}
