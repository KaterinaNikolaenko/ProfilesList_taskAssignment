//
//  UITableView.swift
//  Profiles
//
//  Created by Katerina on 20.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueCell<T: UITableViewCell & ReuseProtocol>(_ cellClass: T.Type, selectionStyle: UITableViewCell.SelectionStyle) -> T {
        
        let cell = self.dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier) as! T
        
        cell.selectionStyle = selectionStyle
        
        return cell
    }
}
