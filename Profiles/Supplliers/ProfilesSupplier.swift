//
//  ProfilesSupplier.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import SwiftyJSON
import Alamofire

class ProfilesSupplier {
    
    private let parser: Parser

    private let loader: Loader
    
    private(set) var profiles: [Profile] = []
    
    init(parser: Parser, loader: Loader) {

        self.parser = parser

        self.loader = loader
    }
}

// MARK: - Fetch profiles
extension ProfilesSupplier {
    
    typealias ProfilesSupplierCompletion = (Result<[Profile]>) -> Void
    
    func getProfiles(_ completion: ProfilesSupplierCompletion?) {
        
        self.loader.getProfiles { [weak self] (result) in
            guard let strongSelf = self else {
                return
            }
            
            switch result {
            case .success(let json):
                let profiles = strongSelf.parseProfiles(json: json)
                strongSelf.profiles = profiles
                completion?(Result.success(profiles))
            case .failure(let error):
                completion?(Result.failure(error))
            }
        }
    }
}

extension ProfilesSupplier {
    
    private enum Keys {
        static let some = "some"
        static let results = "results"
    }
    
    private func parseProfiles(json: JSON) -> [Profile] {
        
        
        guard let jsonArray = json.array?.first?[Keys.some].array else {
            return []
        }
        
        return jsonArray.compactMap({ (object) -> Profile? in
            return self.parser.parseProfile(json: object)
        })
    }
}


