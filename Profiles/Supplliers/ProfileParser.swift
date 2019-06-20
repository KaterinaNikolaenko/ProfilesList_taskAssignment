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
        
        guard let id = json[Keys.id].int,
            let first_name = json[Keys.first_name].string,
            let last_name = json[Keys.last_name].string,
            let profile_picture = json[Keys.profile_picture].string else {
                return nil
        }
        
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

