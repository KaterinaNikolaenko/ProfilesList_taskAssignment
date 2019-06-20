//
//  RequestModel.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Foundation
import Alamofire

struct RequestModel {
    
    let endpoint: String
    
    let methodType: HTTPMethod
    
    let parameters: Parameters?
    
    let encoding: ParameterEncoding
}
