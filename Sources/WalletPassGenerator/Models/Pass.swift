//
//  Pass.swift
//  
//
//  Created by Jing Wei Li on 5/26/21.
//

import Foundation

/// I.e. content of the pass.json file
/// For all available fields and their documentation, see https://developer.apple.com/documentation/walletpasses/pass
public struct Pass: Codable {
    public let formatVersion: Int
    public let passTypeIdentifier: String
    public let serialNumber: String
    public let teamIdentifier: String
    public let organizationName: String
    public let description: String
    public let logoText: String?
    public let foregroundColor: String?
    public let backgroundColor: String?
    public let labelColor: String?
    public let relevantDate: String?
    public let locations: [PassLocation]?
    public let maxDistance: Int?
    public let barcodes: [PassBarcode]
    public let coupon: PassContent?
    public let boardingPass: PassContentTransit?
    public let storeCard: PassContent?
    public let eventTicket: PassContent?
    public let generic: PassContent?
    
    public init(
        formatVersion: Int,
        passTypeIdentifier: String,
        serialNumber: String,
        teamIdentifier: String,
        organizationName: String,
        description: String,
        logoText: String?,
        foregroundColor: PassColor?,
        backgroundColor: PassColor?,
        labelColor: PassColor?,
        barcodes: [PassBarcode] = [],
        relevantDate: String? = nil,
        locations: [PassLocation]? = nil,
        maxDistance: Int? = nil,
        coupon: PassContent? = nil,
        boardingPass: PassContentTransit? = nil,
        storeCard: PassContent? = nil,
        eventTicket: PassContent? = nil,
        genericPass: PassContent? = nil
    ) {
        self.formatVersion = formatVersion
        self.passTypeIdentifier = passTypeIdentifier
        self.serialNumber = serialNumber
        self.teamIdentifier = teamIdentifier
        self.organizationName = organizationName
        self.foregroundColor = foregroundColor?.stringForm
        self.backgroundColor = backgroundColor?.stringForm
        self.labelColor = labelColor?.stringForm
        self.relevantDate = relevantDate
        self.locations = locations
        self.maxDistance = maxDistance
        self.coupon = coupon
        self.barcodes = barcodes
        self.logoText = logoText
        self.description = description
        self.boardingPass = boardingPass
        self.storeCard = storeCard
        self.eventTicket = eventTicket
        self.generic = genericPass
    }
}
