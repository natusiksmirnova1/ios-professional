//
//  ViewController.swift
//  Bankey
//
//  Created by Olesia Ivanova on 10.06.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


}

extension LoginViewController {
    private func style() {
     
    }
    
    private func layout() {
        // add view to viewController
        view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
            
        ])
    }
}


