//
//  ProfilesListPresenter.swift
//  Profiles
//
//  Created by Katerina on 20.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Foundation

protocol ProfilesListPresenterProtocol: class {
    
    func present(profiles: [Profile])
}

class ProfilesListPresenter {
    
    private weak var view: ProfilesListViewProtocol?
}

//MARK: - Accessors
extension ProfilesListPresenter {
    
    func set(view: ProfilesListViewProtocol) {
        
        self.view = view
    }
}

//MARK: - Presenter Protocol
extension ProfilesListPresenter: ProfilesListPresenterProtocol {
    
    func present(profiles: [Profile]) {
        
        DispatchQueue.main.async {
            self.view?.show(profiles: profiles)
        }
    }
}
