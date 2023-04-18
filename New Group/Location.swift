//
//  Location.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 26.03.2023.
//

import Foundation

struct LocationResponse: Codable {
    var info: Info?
    var results: [LocationResult]?
}

struct LocationResult: Codable {
    var id: Int?
    var name, type, dimension: String?
    var residents: [String]?
    var url: String?
    var created: String?
}
