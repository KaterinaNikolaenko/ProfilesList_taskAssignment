//
//  UICollectionView.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    func dequeueCell<T: UICollectionViewCell & ReuseProtocol>(_ cellClass: T.Type, for indexPath: IndexPath) -> T {
        
        return self.dequeueReusableCell(withReuseIdentifier: cellClass.reuseIdentifier, for: indexPath) as! T
    }
}
