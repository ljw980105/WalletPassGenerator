//
//  PassCotnentTransit.swift
//  
//
//  Created by Jing Wei Li on 5/27/21.
//

import Foundation

/// Represents a boarding pass.
/// - Note that for auxiliary fields, the time must be provided and should be in a appropriate time format, e.g.
/// ```
/// .init(key: "Date2", label: "Destination", value: "2021-05-18T17:00Z", dateStyle: .short, timeStyle: .short)
/// ```
public class PassContentTransit: Codable {
    public enum TransitType: String, Codable {
        case air = "PKTransitTypeAir"
        case train = "PKTransitTypeTrain"
        case bus = "PKTransitTypeBus"
        case boat = "PKTransitTypeBoat"
        case generic = "PKTransitTypeGeneric"
    }

    
    public let primaryFields: [Field]
    public let secondaryFields: [Field]?
    public let auxiliaryFields: [Field]?
    public let headerFields: [Field]?
    public let backFields: [Field]?
    public let transitType: TransitType
    
    public init(
        primaryFields: [Field],
        transitType: TransitType,
        secondaryFields: [Field]? = nil,
        auxiliaryFields: [Field]? = nil,
        headerFields: [Field]? = nil,
        backFields: [Field]? = nil
    ) {
        self.primaryFields = primaryFields
        self.secondaryFields = secondaryFields
        self.auxiliaryFields = auxiliaryFields
        self.headerFields = headerFields
        self.backFields = backFields
        self.transitType = transitType
    }
}
