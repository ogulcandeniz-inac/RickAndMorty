//
//  DevelopLocation.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 29.03.2023.
//

import Foundation

struct DevelopLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
    init(id: Int, name: String, type: String, dimension: String, residents: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.url = url
        self.created = created
    }   
}
