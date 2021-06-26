//
//  Pass+Location.swift
//  
//
//  Created by Jing Wei Li on 6/5/21.
//

import Foundation

public extension Pass {
    /// [Documentation](https://developer.apple.com/documentation/walletpasses/pass/locations)
    struct Location: Codable {
        public let latitude: Double
        public let longitude: Double
        public let altitude: Double?
        public let relevantText: String?
        
        public init(
            latitude: Double,
            longitude: Double,
            altitude: Double? = nil,
            relevantText: String? = nil
        ) {
            self.latitude = latitude
            self.longitude = longitude
            self.altitude = altitude
            self.relevantText = relevantText
        }
    }

}
