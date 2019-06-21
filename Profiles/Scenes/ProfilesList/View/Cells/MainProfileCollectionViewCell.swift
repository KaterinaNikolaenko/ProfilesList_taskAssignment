//
//  MainProfileCollectionViewCell.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import UIKit
import Kingfisher

class MainProfileCollectionViewCell: UICollectionViewCell, ReuseProtocol {

    @IBOutlet private weak var profilePictureImageView: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
}

//MARK: - Public
extension MainProfileCollectionViewCell {
    
    func set(urlStr: String) {
        
        if let url = URL(string: urlStr) {
            self.profilePictureImageView.kf.setImage(with: ImageResource(downloadURL: url))
        }
    }
}
