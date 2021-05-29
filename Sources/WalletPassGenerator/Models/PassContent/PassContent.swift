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
    public let auxiliaryFields: [Field]?
    public let headerFields: [Field]?
    public let backFields: [Field]?
    
    public init(
        primaryFields: [Field],
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
    }
}

/// https://developer.apple.com/documentation/walletpasses/passfields
public struct Field: Codable {
    public let key: String
    public let label: String?
    public let value: String
    public let dateStyle: DateTimeStyle?
    public let timeStyle: DateTimeStyle?
    public let textAlignment: TextAlignment?
    /// only works for Auxiliary Fields
    public let row: Int?
    public let attributedValue: String?
    
    public init(
        key: String,
        label: String?,
        value: String,
        dateStyle: DateTimeStyle? = nil,
        timeStyle: DateTimeStyle? = nil,
        textAlignment: TextAlignment? = nil,
        row: Int? = nil,
        attributedValue: String? = nil
    ) {
        self.key = key
        self.label = label
        self.value = value
        self.dateStyle = dateStyle
        self.timeStyle = timeStyle
        self.textAlignment = textAlignment
        self.row = row
        self.attributedValue = attributedValue
    }
}

public enum DateTimeStyle: String, Codable {
    case none = "PKDateStyleNone"
    case short = "PKDateStyleShort"
    case medium = "PKDateStyleMedium"
    case long = "PKDateStyleLong"
    case full = "PKDateStyleFull"
}

public enum TextAlignment: String, Codable {
    case left = "PKTextAlignmentLeft"
    case center = "PKTextAlignmentCenter"
    case right = "PKTextAlignmentRight"
    case natural = "PKTextAlignmentNatural"
}
