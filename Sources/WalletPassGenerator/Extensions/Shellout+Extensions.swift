//
//  Shellout+Extensions.swift
//  
//
//  Created by Jing Wei Li on 5/26/21.
//

import Foundation
import ShellOut

extension ShellOutCommand {
    static func getSHA1ChecksumForFile(
        named name: String,
        at url: String = "."
    ) throws -> String {
        return try shellOut(
            to: "openssl sha1 \(name)",
            at: url
        ) // returns example: SHA1(strip.png)= f9ff3e5c31c0b17aa52de3b58a9bb369f52a53b0
        .components(separatedBy: " ").last ?? ""
    }
}

