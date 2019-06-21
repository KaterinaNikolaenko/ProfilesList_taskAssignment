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

extension UIViewController {
    
    func open(viewController: UIViewController, animated: Bool) {
        
        if let navigationController = self.navigationController {
            navigationController.pushViewController(viewController, animated: animated)
        }
        else {
            self.present(viewController, animated: animated)
        }
    }
}
