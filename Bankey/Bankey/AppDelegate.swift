//
//  AppDelegate.swift
//  Bankey
//
//  Created by Olesia Ivanova on 10.06.2023.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var loginVC = LoginVC()
    var onboarding = OnboardingContainerVC()
    var dummyVC = DummyVC()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginVC.delegate = self
        onboarding.delegate = self
        dummyVC.logOutDelegate = self
        
        window?.rootViewController = loginVC
      //  window?.rootViewController = DummyVC()
          window?.rootViewController = MainViewController()
        
        
//        window?.rootViewController = OnboardingViewController(picName: "delorean", text: "Bankey is faster. easier to use,  and has a brand new look and feel that will make you fee like you are back in 1989")
//        window?.rootViewController = onboarding

        return true
    }
    
    
}



extension AppDelegate: OnboardingContainerVCDelegate {
    func didOnboarding() {
        LocalState.hasOnboarded = true
        setSmoothTransition(dummyVC)
    }
    
    func didClose() {
        setSmoothTransition(dummyVC)
    }
    
}

extension AppDelegate: LoginVCDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setSmoothTransition(dummyVC)
        } else {
            setSmoothTransition(onboarding)} 
    }
    
}
extension AppDelegate: LogoutDelegate {
    func logOut() {
        setSmoothTransition(loginVC)
    }
    
    
}

extension AppDelegate{
    func setSmoothTransition(_ vc: UIViewController, animated: Bool = true){
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3, animations: nil)
    }
}
