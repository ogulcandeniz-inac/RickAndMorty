//
//  CharacterStatus.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 29.03.2023.
//

import Foundation


enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"

    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
