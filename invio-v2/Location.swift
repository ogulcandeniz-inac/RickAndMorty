//
//  Location.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 26.03.2023.
//

import Foundation


class Location:Codable
{
    var location_id:Int?
    var location_name:String?
    var location_type:String?
    var location_dinemsion:String?
    var location_resident:String?
    var location_url:String?
    var location_created:String?
    init() {
        
    }
    
    init(location_id:Int,location_name:String,location_type:String,location_dinemsion:String,location_resident:String, location_url:String,location_created:String)
    {
        self.location_id = location_id
        self.location_name = location_name
        self.location_type = location_type
        self.location_dinemsion = location_dinemsion
        self.location_resident = location_resident
        self.location_url = location_url
        self.location_created = location_created
    }
}
