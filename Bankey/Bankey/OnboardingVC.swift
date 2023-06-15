//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Olesia Ivanova on 12.06.2023.
//

import UIKit

class OnboardingVC: UIViewController{
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    var text: String
    var picName: String
    
    init(picName: String, text: String ){
        self.picName = picName
        self.text = text
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        style()
        layout()
    }
    
}

extension OnboardingVC {
    
    func style(){
        view.backgroundColor = .systemBackground
        stackView.axis = .vertical
        stackView.spacing = 20
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: picName)
        

        label.text = text
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
