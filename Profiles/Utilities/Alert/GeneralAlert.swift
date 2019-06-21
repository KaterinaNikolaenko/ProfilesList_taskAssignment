//
//  GeneralAlert.swift
//  Profiles
//
//  Created by Katerina on 21.06.19.
//  Copyright © 2019 Katerina. All rights reserved.
//

import UIKit

public protocol SimpleAlertProtocol: class {}

extension SimpleAlertProtocol where Self: UIViewController {
    
    func showGeneralPopUp(_ title: String, message: String) {
        let popup = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .default) { (_) in
                                    popup.dismiss(animated: true, completion: nil)
        }
        popup.addAction(action)
        self.present(popup, animated: true, completion: nil)
    }
}
