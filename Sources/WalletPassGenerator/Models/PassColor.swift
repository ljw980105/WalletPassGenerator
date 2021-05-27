//
//  PassColor.swift
//  
//
//  Created by Jing Wei Li on 5/26/21.
//

import Foundation

public enum PassColor {
    case rgb(r: Int, g: Int, b: Int)
    case string(String)
    
    var stringForm: String {
        switch self {
        case .rgb(r: let r, g: let g, b: let b):
            return "rgb(\(r), \(g), \(b))"
        case .string(let str):
            return str
        }
        
    }
}
