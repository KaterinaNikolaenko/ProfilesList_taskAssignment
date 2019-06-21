//
//  ViewControllersFactory.swift
//  Profiles
//
//  Created by Katerina on 20.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import Foundation
import UIKit

final class ViewControllersFactory {
    
    //MARK: Init
    init() {}
}

extension ViewControllersFactory {
    
    static func getMainController() -> ProfileNavigationController {
        
        let parser = ProfilesSupplier.Parser()
        let loader = ProfilesSupplier.Loader()
        let supplier = ProfilesSupplier(parser: parser, loader: loader)
        
        let viewController = ProfilesListViewController()
        let presenter = ProfilesListPresenter()
        let interactor = ProfilesListInteractor(supplier: supplier)
        
        viewController.set(interactor: interactor)
        interactor.set(presenter: presenter)
        presenter.set(view: viewController)
        
        let navig = ProfileNavigationController(rootViewController: viewController)
        
        return navig
    }
    
    static func getProfileDetailsController(profile: Profile) -> ProfileDetailsViewController {
        
        let parser = ProfilesSupplier.Parser()
        let loader = ProfilesSupplier.Loader()
        let supplier = ProfilesSupplier(parser: parser, loader: loader)
        
        let viewController = ProfileDetailsViewController()
        let presenter = ProfileDetailsPresenter()
        let interactor = ProfileDetailsInteractor(supplier: supplier, profile: profile)
        
        viewController.set(interactor: interactor)
        interactor.set(presenter: presenter)
        presenter.set(view: viewController)
                
        return viewController
    }
}

