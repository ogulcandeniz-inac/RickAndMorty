//
//  Character.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 25.03.2023.
//

import Foundation

class Character:Codable
{
    var id:Int?
    var name:String?
    var status:String?
    var species:String?
    var type:String?
    var gender:String?
    var origin:String?
    var location:String?
    var image:String?
    var episode:String?
    var url:String?
    var created:String?
    
    
    init()
    {
        
    }
    init(id:Int,name:String,status:String,species:String,type:String,gender:String,origin:String,location:String,image:String,episode:String,url:String,created:String)
    {
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










