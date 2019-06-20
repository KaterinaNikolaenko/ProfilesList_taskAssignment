//
//  NetworkManager.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Alamofire
import SwiftyJSON

class NetworkManager {
    
    typealias BaseJSONResponse = (Result<JSON>) -> Void
    
    private let manager : SessionManager
    static let shared = NetworkManager()
    
    private init() {
        
        self.manager = Alamofire.SessionManager()
    }
    
    func request(model: RequestModel, completion: @escaping BaseJSONResponse) {
        
        self.manager.request(model.endpoint, method: model.methodType, parameters: model.parameters, encoding: model.encoding, headers: nil).responseJSON { (dataResponse) in
            
            if let error = dataResponse.result.error {
                completion(Result.failure(error))
            } else {
                let json = JSON(arrayLiteral: dataResponse.result.value ?? [:])
                completion(Result.success(json))
            }
        }
    }
}

