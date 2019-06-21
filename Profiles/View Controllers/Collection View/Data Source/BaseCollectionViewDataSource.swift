//
//  BaseCollectionViewDataSource.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Foundation
import UIKit

class BaseCollectionViewDataSource<T>: NSObject, UICollectionViewDataSource {
    
    private(set) var items: [T] = []
    
    func set(items: [T]) {
        
        self.items = items
    }
    
    func item(at index: Int) -> T? {
        
        return items[index]
    }
    
    //MARK: Main
    func registerRequiredCells(for collectionView: UICollectionView) {
        
    }
    
    func cellForItem(_ item: T, at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let item = self.item(at: indexPath.row) else {
            return UICollectionViewCell()
        }
        
        return self.cellForItem(item, at: indexPath, in: collectionView)
    }
}
