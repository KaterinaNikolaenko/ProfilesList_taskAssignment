//
//  Profile.swift
//  Profiles
//
//  Created by Katerina on 20.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Foundation

class Profile: Codable {
    
    let id: Int
    
    var first_name: String?
    
    var last_name: String?
    
    var profile_picture: String
    
    var isFavorite: Bool
    
    init(id: Int, first_name: String?, last_name: String?, profile_picture: String, isFavorite: Bool) {
        
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.profile_picture = profile_picture
        self.isFavorite = false
    }
}
