//
//  LoginView.swift
//  Bankey
//
//  Created by Olesia Ivanova on 10.06.2023.
//

import Foundation
import UIKit

class LoginView: UIView{
    
    let stackView = UIStackView()
    let nameTF = UITextField()
    let divider = UIView()
    let passwordTF = UITextField()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override var intrinsicContentSize: CGSize{
//        return CGSize(width: 200, height: 200)
//    }
}

extension LoginView {
    func style () {
        backgroundColor = .secondarySystemFill
        layer.cornerRadius = 5
        clipsToBounds = true
        stackView.axis = .vertical
        stackView.spacing = 8
        
        // tf is going to send us messages through its protocol
        nameTF.placeholder = "Username"
        nameTF.delegate = self
        
        divider.backgroundColor = .lightGray
        
        passwordTF.placeholder = "Password"
        passwordTF.delegate = self
        passwordTF.isSecureTextEntry = true
    }
    
    func layout(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        divider.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        stackView.addArrangedSubview(nameTF)
        stackView.addArrangedSubview(divider)
        stackView.addArrangedSubview(passwordTF)
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTF.endEditing(true)
        passwordTF.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
 }

