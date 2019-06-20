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
    
    let first_name: String
    
    let last_name: String
    
    let profile_picture: String
    
    let isFavorite: Bool
}
