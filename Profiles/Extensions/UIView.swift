//
//  UIView.swift
//  Profiles
//
//  Created by Katerina on 20.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviewWithConstraints(_ view: UIView, constants: (top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat)) {
        
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: constants.top)
        let bottomConstraint = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: constants.bottom)
        let leftConstraint = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: constants.left)
        let rightConstraint = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: constants.right)
        
        self.addConstraints([topConstraint, bottomConstraint, leftConstraint, rightConstraint])
    }
    
    @discardableResult
    func addSubviewWithZeroConstraints(_ view: UIView) -> [NSLayoutConstraint] {
        
        return self.addSubviewWithConstraints(view, constraintArray: [0, 0, 0, 0])
    }
    
    @discardableResult
    func addSubviewWithConstraints(_ view: UIView, constraintArray: [CGFloat]) -> [NSLayoutConstraint] {
        
        guard constraintArray.count > 3 else {
            return []
        }
        
        self.addSubview(view)
        
        return self.addConstraints(for: view,
                                   top: constraintArray[0],
                                   bottom: constraintArray[1],
                                   leading: constraintArray[2],
                                   trailing: constraintArray[3])
    }
    
    @discardableResult
    func addConstraints(for view: UIView, top: CGFloat?, bottom: CGFloat?, leading: CGFloat?, trailing: CGFloat?, priority: UILayoutPriority = .required) -> [NSLayoutConstraint] {
        
        guard view.isDescendant(of: self) else {
            return []
        }
        
        var constraints: [NSLayoutConstraint] = []
        
        if let top = top {
            let topConstraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: top)
            topConstraint.priority = priority
            constraints.append(topConstraint)
        }
        
        if let bottom = bottom {
            let bottomConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: bottom)
            bottomConstraint.priority = priority
            constraints.append(bottomConstraint)
        }
        
        if let leading = leading {
            let leftConstraint = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: leading)
            leftConstraint.priority = priority
            constraints.append(leftConstraint)
        }
        
        if let trailing = trailing {
            let rightConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: trailing)
            rightConstraint.priority = priority
            constraints.append(rightConstraint)
        }
        
        self.addConstraints(constraints)
        
        return constraints
    }
}
