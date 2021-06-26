//
//  Pass+Beacons.swift
//  
//
//  Created by Jing Wei Li on 6/26/21.
//

import Foundation

public extension Pass {
    /// Show a pass when an iBeacon is nearby
    /// [Documentation](https://developer.apple.com/documentation/walletpasses/pass/beacons)
    struct Beacon: Codable {
        public let proximityUUID: String
        public let major: UInt16?
        public let minor: UInt16?
        public let relevantText: String?
        
        public init(
            proximityUUID: String,
            major: UInt16? = nil,
            minor: UInt16? = nil,
            relevantText: String? = nil
        ) {
            self.proximityUUID = proximityUUID
            self.major = major
            self.minor = minor
            self.relevantText = relevantText
        }
    }
}
