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
    
    init() {
        
    }
    
    init(location_id:Int,location_name:String)
    {
        self.location_id = location_id
        self.location_name = location_name
    }
}
