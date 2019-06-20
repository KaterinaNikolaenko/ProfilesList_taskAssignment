//
//  ReuseProtocol.swift
//  Profiles
//
//  Created by Katerina on 20.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Foundation
import UIKit

public protocol ReuseProtocol {
    
    static var className: String {get}
}

public extension ReuseProtocol {
    
    static var reuseIdentifier: String {
        return self.className
    }
    
    static func nib() -> UINib {
        
        return UINib(nibName: self.className, bundle: nil)
    }
}

public extension ReuseProtocol {
    
    static var className: String {
        return String(describing: self)
    }
}

public extension UITableView {
    
    func registerCell(_ cell: ReuseProtocol.Type) {
        
        self.register(cell.nib(), forCellReuseIdentifier: cell.reuseIdentifier)
    }
    
    func registerSupplimentaryView(_ cell: ReuseProtocol.Type) {
        
        self.register(cell.nib(), forHeaderFooterViewReuseIdentifier: cell.reuseIdentifier)
    }
}
