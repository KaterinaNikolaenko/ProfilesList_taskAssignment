//
//  Result.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Foundation

enum Result<T> {
    
    case success(T)
    case failure(Error)
    
    var value: T? {
        switch self {
        case .success(let result):
            return result
        case .failure:
            return nil
        }
    }
    
    var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}
