//
//  MainProfileCollectionViewCell.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import UIKit
import Kingfisher

class MainProfileCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet private weak var profilePictureImageView: UIImageView!
    @IBOutlet private weak var isFavoriteImageView: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.config()
    }
    
    private func config() {
        
        self.isFavoriteImageView.isHidden = true
    }
}

//MARK: - Public
extension MainProfileCollectionViewCell {
    
    func set(urlStr: String) {
        
        if let url = URL(string: urlStr) {
            self.profilePictureImageView.kf.setImage(with: ImageResource(downloadURL: url))
        }
    }
    
    func set(isFavorite: Bool) {
        
        self.isFavoriteImageView.isHidden = !isFavorite
    }
}
