//
//  ProfileParser.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import SwiftyJSON

extension ProfilesSupplier {
    
    class Parser {
    }
}

extension ProfilesSupplier.Parser {
    
    func parseProfile(json: JSON) -> Profile? {
        
        let id = json.dictionary?[Keys.id]?.int ?? 0
        let first_name = json.dictionary?[Keys.first_name]?.string
        let last_name = json.dictionary?[Keys.last_name]?.string
        let profile_picture = json.dictionary?[Keys.profile_picture]?.string ?? ""
        
        return Profile(id: id, first_name: first_name, last_name: last_name, profile_picture: profile_picture, isFavorite: false)
    }
}

extension ProfilesSupplier.Parser {
    
    fileprivate enum Keys {
        static let id = "id"
        static let first_name = "first_name"
        static let last_name = "last_name"
        static let profile_picture = "profile_picture"
    }
}

