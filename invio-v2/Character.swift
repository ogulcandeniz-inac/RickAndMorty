//
//  Character.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 25.03.2023.
//

import Foundation

class Character:Codable
{
    var resultss:[Character]?
    
    var id:Int?
    var name:String?
    var status: CharacterStatus
    var species:String?
    var type:String?
    var gender: CharacterGender
    var origin: Origin
    var location: Location
    var image:String?
    var episode:String?
    var url:String?
    var created:String?
    
    
    
    
        
    init(id: Int? = nil, name: String? = nil, status: CharacterStatus, species: String? = nil, type: String? = nil, gender: CharacterGender, origin: Origin, location: Location, image: String? = nil, episode: String? = nil, url: String? = nil, created: String? = nil) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
    
}
