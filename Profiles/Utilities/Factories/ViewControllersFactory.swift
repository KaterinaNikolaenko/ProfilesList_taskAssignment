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
    
    static func getMainController() -> ProfilesListViewController {
        
        let viewController = ProfilesListViewController()
        let presenter = ProfilesListPresenter()
        let interactor = ProfilesListInteractor()
        
        viewController.set(interactor: interactor)
        interactor.set(presenter: presenter)
        presenter.set(view: viewController)
        
        return viewController
    }
}

