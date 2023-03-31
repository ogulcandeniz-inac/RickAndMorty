//
//  Episode.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 26.03.2023.
//

import Foundation


class Episode:Codable
{
    var episode_id:Int?
    var episode_name:String?
    var episode_date:String?
    var episode:String?
    var episode_character:String?
    var episode_url:String?
    var episode_created:String?
    
    init(episode_id: Int? = nil, episode_name: String? = nil, episode_date: String? = nil, episode: String? = nil, episode_character: String? = nil, episode_url: String? = nil, episode_created: String? = nil) {
        self.episode_id = episode_id
        self.episode_name = episode_name
        self.episode_date = episode_date
        self.episode = episode
        self.episode_character = episode_character
        self.episode_url = episode_url
        self.episode_created = episode_created
    }
}
