//
//  Character.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 25.03.2023.
//

import Foundation

class Character:Codable
{
    var character_id:Int?
    var character_name:String?
    var character_status:String?
    var character_species:String?
    var character_type:String?
    var character_gender:String?
    var character_origin:String?
    var character_location:String?
    var character_image:String?
    var character_episode:String?
    var character_url:String?
    var character_created:String?
    
    
    init()
    {
        
    }
    init(character_id:Int,character_name:String,scharacter_tatus:String,character_species:String,character_type:String,character_gender:String,character_origin:String,character_location:String,character_image:String,character_episode:String,character_url:String,character_created:String,character_status:String)
    {
        self.character_id = character_id
        self.character_name = character_name
        self.character_status = character_status
        self.character_species = character_species
        self.character_type = character_type
        self.character_gender = character_gender
        self.character_origin = character_origin
        self.character_location = character_location
        self.character_image = character_image
        self.character_episode = character_episode
        self.character_url = character_url
        self.character_created = character_created
    }
    
    
    
    
    
}










