//
//  ViewController.swift
//  Profiles
//
//  Created by Katerina on 20.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var defaultBackground: UIColor? {
        return UIColor.white
    }
    
    class var nibFile: String? {
        return nil
    }
    
    //MARK: Init
    init() {
        
        super.init(nibName: type(of: self).nibFile, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        self.view.backgroundColor = self.defaultBackground
    }
}

