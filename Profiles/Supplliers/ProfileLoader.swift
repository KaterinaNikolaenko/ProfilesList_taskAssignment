//
//  ProfileLoader.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Alamofire
import SwiftyJSON

extension ProfilesSupplier {
    
    class Loader {
        
        private let networkManager: NetworkManager
        
        init(networkManager: NetworkManager = .shared) {
            
            self.networkManager = networkManager
        }
    }
}

extension ProfilesSupplier.Loader {
    
    typealias ProfilesLoaderCompletion = (Result<JSON>) -> Void
    
    func getProfiles(_ completion: ProfilesLoaderCompletion?) {
        
        let model = RequestModel(endpoint: ApiEndpoints.baseURL, methodType: .get, parameters: nil, encoding: URLEncoding.default)
        
        self.networkManager.request(model: model) { (result) in
            switch result {
            case .success(let json):
                completion?(Result.success(json))
            case .failure(let error):
                completion?(Result.failure(error))
            }
        }
    }
}


