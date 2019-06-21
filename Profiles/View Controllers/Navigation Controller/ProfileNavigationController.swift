//
//  ProfileNavigationController.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import UIKit

class ProfileNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.setup()
    }
    
    private func setup() {
        
        self.graphicSetup()
    }
    
    private func graphicSetup() {
        
        navigationBar.barTintColor = UIColor.lightGray
        navigationBar.isTranslucent = false
        navigationBar.tintColor = .white
    }
}
