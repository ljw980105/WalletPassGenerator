//
//  PassCotnentTransit.swift
//  
//
//  Created by Jing Wei Li on 5/27/21.
//

import Foundation

public class PassContentTransit: Codable {
    public let primaryFields: [Field]
    public let secondaryFields: [Field]?
    public let auxiliaryFields: [AuxiliaryField]?
    public let headerFields: [Field]?
    public let backFields: [Field]?
    public let transitType: String
    
    public init(
        primaryFields: [Field],
        transitType: TransitType,
        secondaryFields: [Field]? = nil,
        auxiliaryFields: [AuxiliaryField]? = nil,
        headerFields: [Field]? = nil,
        backFields: [Field]? = nil
    ) {
        self.primaryFields = primaryFields
        self.secondaryFields = secondaryFields
        self.auxiliaryFields = auxiliaryFields
        self.headerFields = headerFields
        self.backFields = backFields
        self.transitType = transitType.rawValue
    }
}

public enum TransitType: String {
    case air = "PKTransitTypeAir"
    case train = "PKTransitTypeTrain"
    case bus = "PKTransitTypeBus"
    case boat = "PKTransitTypeBoat"
    case generic = "PKTransitTypeGeneric"
}


