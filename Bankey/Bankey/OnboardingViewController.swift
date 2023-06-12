//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Olesia Ivanova on 12.06.2023.
//

import UIKit

class OnboardingViewController: UIViewController{
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        style()
        layout()
    }
    
}

extension OnboardingViewController {
    
    func style(){
        stackView.axis = .vertical
        stackView.spacing = 20
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "delorean")
        
        label.text = "Bankey is faster. easier to use,  and has a brand new look and feel that will make you fee like you are back in 1989"
        label.font = UIFont.preferredFont(forTextStyle: .title3) // dynamic Type
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .center
    }
    
    func layout(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
            
        ])
    }
}
