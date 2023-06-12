//
//  AppDelegate.swift
//  Bankey
//
//  Created by Olesia Ivanova on 10.06.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = LoginViewController()
//        window?.rootViewController = OnboardingViewController(picName: "delorean", text: "Bankey is faster. easier to use,  and has a brand new look and feel that will make you fee like you are back in 1989")
        window?.rootViewController = OnboardingContainerViewController()
        
        return true
    }

}

