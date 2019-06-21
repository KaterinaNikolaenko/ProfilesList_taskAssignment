//
//  CollectionViewController.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import UIKit

class BaseCollectionViewController: BaseViewController {
    
    @IBOutlet private(set) weak var collectionView: UICollectionView!
    
    class var collectionViewLayout: UICollectionViewLayout {
        return UICollectionViewFlowLayout()
    }
    
    //MARK: - Life Cycle
    override func loadView() {
        
        super.loadView()
        
        self.loadCollectionViewIfNeeded()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
}

extension BaseCollectionViewController {
    
    private func loadCollectionViewIfNeeded() {
        
        guard type(of: self).nibFile == nil, self.collectionView == nil else {
            return
        }
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: type(of: self).collectionViewLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubviewAndPinToEdges(collectionView)
        
        self.collectionView = collectionView
    }
}
