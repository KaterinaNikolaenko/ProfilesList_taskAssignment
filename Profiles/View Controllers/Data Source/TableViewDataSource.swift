//
//  TableViewDataSource.swift
//  Profiles
//
//  Created by Katerina on 20.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<T>: NSObject, UITableViewDataSource {
    
    private(set) var items: [T] = []
    
    func set(items: [T]) {
        
        self.items = items
    }
    
    func remove(at index: Int) {
        
        if self.items.indices.contains(index) {
            self.items.remove(at: index)
        }
    }
    
    func add(item: T) {
        
        self.items.append(item)
    }
    
    func insert(newItem: T, at index: Int) {
        
        self.items.insert(newItem, at: index)
    }
    
    func item(at index: Int) -> T? {
        
        return items[index]
    }
    
    // MARK: - Lifecycle
    override init() {
        
        super.init()
    }
    
    //MARK: Main
    func cellForItem(_ item: T, at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let item = self.item(at: indexPath.row) else {
            return UITableViewCell()
        }
        
        return self.cellForItem(item, at: indexPath, in: tableView)
    }
    
    func registerRequiredCells(for tableView: UITableView) {}
}

