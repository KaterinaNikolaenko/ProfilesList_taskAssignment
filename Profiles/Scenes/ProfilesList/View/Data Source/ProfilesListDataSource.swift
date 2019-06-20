//
//  ProfilesListDataSource.swift
//  Profiles
//
//  Created by Katerina on 20.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Foundation
import  UIKit

class ProfilesListDataSource: TableViewDataSource<Profile> {
    
    override func cellForItem(_ item: Profile, at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        
        return self.mainProfileCell(item, tableView: tableView, at: indexPath)
    }
    
    private func mainProfileCell(_ item: Profile, tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueCell(MainProfileTableViewCell.self, selectionStyle: .none)
        
//        cell.set(image: item.image)
        
        return cell
    }
    
    override func registerRequiredCells(for tableView: UITableView) {
        
        tableView.registerCell(MainProfileTableViewCell.self)
    }
}




