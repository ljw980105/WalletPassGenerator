//
//  Pass.swift
//  
//
//  Created by Jing Wei Li on 5/26/21.
//

import Foundation

/// I.e. content of the pass.json file
/// For all available fields and their documentation, see [this page](https://developer.apple.com/documentation/walletpasses/pass)
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
    public let locations: [Location]?
    public let maxDistance: Int?
    public let barcodes: [Barcode]
    public let beacons: [Beacon]?
    public let nfc: [NFC]?
    public let appLaunchURL: String?
    public let associatedStoreIdentifiers: [Int]?
    public let authenticationToken: String?
    public let expirationDate: String?
    public let groupingIdentifier: String?
    public let sharingProhibited: Bool?
    public let suppressStripShine: Bool?
    public let userInfo: [String: String]?
    public let voided: Bool?
    public let webServiceURL: String?
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
        foregroundColor: Color?,
        backgroundColor: Color?,
        labelColor: Color?,
        barcodes: [Barcode] = [],
        relevantDate: String? = nil,
        locations: [Location]? = nil,
        maxDistance: Int? = nil,
        beacons: [Beacon]? = nil,
        nfc: [NFC]? = nil,
        appLaunchURL: String? = nil,
        associatedStoreIdentifiers: [Int]? = nil,
        authenticationToken: String? = nil,
        expirationDate: String? = nil,
        groupingIdentifier: String? = nil,
        sharingProhibited: Bool? = nil,
        suppressStripShine: Bool? = nil,
        userInfo: [String: String]? = nil,
        voided: Bool? = nil,
        webServiceURL: String? = nil,
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
        self.beacons = beacons
        self.nfc = nfc
        self.appLaunchURL = appLaunchURL
        self.associatedStoreIdentifiers = associatedStoreIdentifiers
        self.authenticationToken = authenticationToken
        self.expirationDate = expirationDate
        self.groupingIdentifier = groupingIdentifier
        self.sharingProhibited = sharingProhibited
        self.suppressStripShine = suppressStripShine
        self.userInfo = userInfo
        self.voided = voided
        self.webServiceURL = webServiceURL
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
