//
//  PassContent.swift
//  
//
//  Created by Jing Wei Li on 5/26/21.
//

import Foundation

public class PassContent: Codable {
    public let primaryFields: [Field]
    public let secondaryFields: [Field]?
    public let auxiliaryFields: [AuxiliaryField]?
    public let headerFields: [Field]?
    public let backFields: [Field]?
    
    public init(
        primaryFields: [Field],
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
    }
}

public struct Field: Codable {
    public let key: String
    public let label: String?
    public let value: String
    
    public init(
        key: String,
        label: String?,
        value: String
    ) {
        self.key = key
        self.label = label
        self.value = value
    }
}

public struct AuxiliaryField: Codable {
    public let key: String
    public let label: String
    public let value: String
    public let dateStyle: String
    public let timeStyle: String
    
    public init(
        key: String,
        label: String,
        value: String,
        dateStyle: DateTimeStyle,
        timeStyle: DateTimeStyle
    ) {
        self.key = key
        self.label = label
        self.value = value
        self.dateStyle = dateStyle.rawValue
        self.timeStyle = timeStyle.rawValue
    }
}
public enum DateTimeStyle: String {
    case none = "PKDateStyleNone"
    case short = "PKDateStyleShort"
    case medium = "PKDateStyleMedium"
    case long = "PKDateStyleLong"
    case full = "PKDateStyleFull"
}
