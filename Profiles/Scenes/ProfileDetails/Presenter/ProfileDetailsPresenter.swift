//
//  ProfileDetailsPresenter.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Foundation

protocol ProfileDetailsPresenterProtocol: class {
    
    func present(profile: Profile)
    func presentError()
}

class ProfileDetailsPresenter {
    
    private weak var view: ProfileDetailsViewProtocol?
}

//MARK: - Accessors
extension ProfileDetailsPresenter {
    
    func set(view: ProfileDetailsViewProtocol) {
        
        self.view = view
    }
}

//MARK: - Presenter Protocol
extension ProfileDetailsPresenter: ProfileDetailsPresenterProtocol {
    
    func present(profile: Profile) {
        
        DispatchQueue.main.async {
            self.view?.show(profile: profile)
        }
    }
    
    func presentError() {
        
        DispatchQueue.main.async {
            self.view?.showErrorMessage()
        }
    }
}
