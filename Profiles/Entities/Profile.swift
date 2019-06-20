//
//  Profile.swift
//  Profiles
//
//  Created by Katerina on 20.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Foundation

struct Profile: Codable {
    
    let id: Int
    
    let first_name: String?
    
    let last_name: String?
    
    let profile_picture: String
    
    let isFavorite: Bool
    
    init(id: Int, first_name: String?, last_name: String?, profile_picture: String, isFavorite: Bool) {
        
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.profile_picture = profile_picture
        self.isFavorite = false
    }
}
