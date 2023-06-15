//
//  DummyVC.swift
//  Bankey
//
//  Created by Olesia Ivanova on 14.06.2023.
//
import UIKit

class DummyVC: UIViewController{
    
    let stackView = UIStackView()
    let label = UILabel()
    let signOut  = UIButton(type: .system)
    
    weak var logOutDelegate: LogoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
}

extension DummyVC {
    
    func style(){
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.text = "Welcome"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        signOut.translatesAutoresizingMaskIntoConstraints = false
        signOut.configuration = .filled()
        signOut.setTitle("Sign Out", for: [])
        signOut.addTarget(self, action: #selector(signOutTapped), for: .primaryActionTriggered)
        
    }
    
    func layout(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(signOut)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
     @ objc func signOutTapped(){
         logOutDelegate?.logOut()
    }
}
