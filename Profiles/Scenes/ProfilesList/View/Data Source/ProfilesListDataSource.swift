//
//  ProfilesListDataSource.swift
//  Profiles
//
//  Created by Katerina on 20.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Foundation
import  UIKit

class ProfilesListDataSource: BaseCollectionViewDataSource<Profile> {
    
    override func cellForItem(_ item: Profile, at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        
        return self.mainProfileCell(item, collectionView: collectionView, at: indexPath)
    }
    
    private func mainProfileCell(_ item: Profile, collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueCell(MainProfileCollectionViewCell.self, for: indexPath)
        
        cell.set(urlStr: item.profile_picture)
        
        return cell
    }
    
    override func registerRequiredCells(for collectionView: UICollectionView) {
        
        collectionView.registerCell(MainProfileCollectionViewCell.self)
    }
}


