//
//  UIViewController.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import UIKit

extension UIViewController {

    @discardableResult
    func addSubviewAndPinToEdges(_ view: UIView) -> [NSLayoutConstraint] {
        
        return self.view.addSubviewWithZeroConstraints(view)
    }
}

public extension UICollectionView {
    
    func dequeueCell<T: UICollectionViewCell & ReuseProtocol>(_ cellClass: T.Type, for indexPath: IndexPath) -> T {
        
        return self.dequeueReusableCell(withReuseIdentifier: cellClass.reuseIdentifier, for: indexPath) as! T
    }
}
