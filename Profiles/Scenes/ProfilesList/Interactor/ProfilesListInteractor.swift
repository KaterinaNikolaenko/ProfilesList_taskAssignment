//
//  ProfilesListInteractor.swift
//  Profiles
//
//  Created by Katerina on 20.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Foundation

protocol ProfilesListInteractorProtocol: class {
    
    func getData()    
}

class ProfilesListInteractor {
    
    private var presenter: ProfilesListPresenterProtocol!
    
//    private let supplier: ProfilesSupplier
    
//    init(supplier: ProfilesSupplier) {
//
//        self.supplier = supplier
//    }
}

//MARK: - Accessors
extension ProfilesListInteractor {
    
    func set(presenter: ProfilesListPresenterProtocol) {
        
        self.presenter = presenter
    }
}

//MARK: - Interactor Protocol
extension ProfilesListInteractor: ProfilesListInteractorProtocol {
    
    func getData() {
        
//        self.supplier.getProfiles { [weak self] (result) in
//            guard let strongSelf = self else {
//                return
//            }
//
//            switch result {
//            case .success(let trainings):
//                strongSelf.presenter.present(trainings: trainings)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
}
