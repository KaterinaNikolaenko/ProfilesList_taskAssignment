//
//  ProfileDetailsViewController.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import UIKit
import Kingfisher

protocol ProfileDetailsViewProtocol: class {
    
    func show(profile: Profile)
    func showErrorMessage()
}

class ProfileDetailsViewController: BaseViewController {

    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var isFavoriteImageView: UIImageView!
    
    private var interactor: ProfileDetailsInteractorProtocol!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.configure()
        
        self.interactor.getDetails()
    }
    
    //MARK: Configuration
    private func configure() {

        self.isFavoriteImageView.isHidden = false
    }
}

//MARK: - Actions
extension ProfileDetailsViewController {
    
    @IBAction private func makeFavorite(_ sender: Any) {
        
        self.interactor.makeFavorite()
    }
}

//MARK: - Public
extension ProfileDetailsViewController {
    
    func set(interactor: ProfileDetailsInteractorProtocol) {
        
        self.interactor = interactor
    }
}

//MARK: - View Protocol
extension ProfileDetailsViewController: ProfileDetailsViewProtocol, SimpleAlertProtocol {
    
    func show(profile: Profile) {
        
        if let url = URL(string: profile.profile_picture) {
            self.mainImageView.kf.setImage(with: ImageResource(downloadURL: url))
        }
        
        self.title = (profile.first_name ?? "") + " " + (profile.last_name ?? "")
        self.isFavoriteImageView.isHidden = !profile.isFavorite
    }
    
    func showErrorMessage() {
        
        self.showGeneralPopUp("Error!", message: "500 Internal Server Error")
    }
}
