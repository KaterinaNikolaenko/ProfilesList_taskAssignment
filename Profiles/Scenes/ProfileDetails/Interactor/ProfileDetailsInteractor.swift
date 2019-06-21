//
//  ProfileDetailsInteractor.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Foundation

protocol ProfileDetailsInteractorProtocol: class {
    
    func getDetails()
    func makeFavorite()
}

class ProfileDetailsInteractor {
    
    private var presenter: ProfileDetailsPresenterProtocol!
    
    private let supplier: ProfilesSupplier
    
    private var profile: Profile
    
    init(supplier: ProfilesSupplier, profile: Profile) {
        
        self.supplier = supplier
        self.profile = profile
    }
}

//MARK: - Accessors
extension ProfileDetailsInteractor {
    
    func set(presenter: ProfileDetailsPresenterProtocol) {
        
        self.presenter = presenter
    }
}

//MARK: - Interactor Protocol
extension ProfileDetailsInteractor: ProfileDetailsInteractorProtocol {
    
    func makeFavorite() {
        
        self.profile.isFavorite = !self.profile.isFavorite
        self.presenter.present(profile: profile)
    }
    
    func getDetails() {
        
        self.supplier.getProfile(id: profile.id) { [weak self] (result) in
            guard let strongSelf = self else {
                return
            }
            
            switch result {
            case .success(let profile):
                if profile != nil {
                    profile?.isFavorite = strongSelf.profile.isFavorite
                    strongSelf.profile.first_name = profile!.first_name
                    strongSelf.profile.last_name = profile!.last_name
                    strongSelf.presenter.present(profile: profile!)
                }
            case .failure(let error):
                strongSelf.presenter.presentError()
            }
        }
    }
}
