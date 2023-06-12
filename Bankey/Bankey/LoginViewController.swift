//
//  ViewController.swift

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    
    var nameGetted: String? {
        return loginView.nameTF.text
    }
    var passwordGetted: String? {
        return loginView.passwordTF.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


}

extension LoginViewController {
    private func style() {
     
        errorMessageLabel.isHidden = true
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.textAlignment = .center
        
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
    }
    
    private func layout() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        // add view to viewController
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
            
        ])
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 1),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
        ])
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorMessageLabel.trailingAnchor, multiplier: 1)
        ])
    }
    
    @objc func signInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
        login()
    }
    func login() {
        guard let nameGetted = nameGetted, let passwordGetted  = passwordGetted else {
            assertionFailure("password/ user should never be nil")
            return
        }
        if nameGetted == "" || passwordGetted == "" {
            configureMessage(withMessage: "User name or password cannot be blank")
            return
        }
        
        if nameGetted == "Kevin" && passwordGetted == "123" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureMessage(withMessage: "Incorrect password or user name")
        }
        if nameGetted == "" || passwordGetted == "" {
            configureMessage(withMessage: "User name or password cannot be blank")
        }
        
    }
    
    func configureMessage(withMessage message: String)  {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}


