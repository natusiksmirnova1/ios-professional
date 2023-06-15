//
//  OnboardingContainerViewController.swift
//  Bankey
//
//  Created by Olesia Ivanova on 12.06.2023.
//

import UIKit
protocol OnboardingContainerVCDelegate: AnyObject{
    func didClose()
    func didOnboarding()
}

class OnboardingContainerVC: UIViewController {

    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentVC: UIViewController {
        didSet{
            guard let index = pages.firstIndex(of: currentVC) else {return}
            doneButton.isHidden = !(index == pages.count - 1) // last page
            nextButton.isHidden = index == pages.count - 1 // hide if on last
            backButton.isHidden = index == 0 // on first page
            
        }
    }
    
    let closeButton = UIButton(type: .system)
    let nextButton = UIButton(type: .system)
    let backButton = UIButton(type: .system)
    let doneButton = UIButton(type: .system)

    weak var delegate: OnboardingContainerVCDelegate?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

        let page1 = OnboardingVC(picName: "delorean", text: "Bankey is faster. easier to use,  and has a brand new look and feel that will make you fee like you are back in 1989")
        let page2 = OnboardingVC(picName: "world", text: "Move your money around the world quickly and securely")
        let page3 = OnboardingVC(picName: "thumbs", text: "Learn more at www.bankey.com")

        pages.append(page1)
        pages.append(page2)
        pages.append(page3)

        self.currentVC = pages.first!

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }
    
    private func setup(){
        view.backgroundColor = .systemPurple
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
        ])
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
         currentVC = pages.first!  // не понятно нужен или нет снова
    }
    
    private func style(){
        closeButton.setTitle("Close", for: [])
        closeButton.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)
        doneButton.setTitle("Done", for: [])
        doneButton.addTarget(self, action: #selector(doneTapped), for: .primaryActionTriggered)
        nextButton.setTitle("Next", for: [])
        nextButton.addTarget(self, action: #selector(nextTapped), for: .primaryActionTriggered)
        backButton.setTitle("Back", for: [])
        backButton.addTarget(self, action: #selector(backTapped), for: .primaryActionTriggered)
        
    }
 
    private func layout(){
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(closeButton)
        view.addSubview(doneButton)
        view.addSubview(nextButton)
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            doneButton.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: doneButton.trailingAnchor, multiplier: 2),
            view.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 8),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2),
            view.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: backButton.bottomAnchor, multiplier: 8),
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2)
        ])
    }
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingContainerVC: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }

    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }

    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}
// MARK: - Actions

extension OnboardingContainerVC {
    
    @objc func closeTapped(){
        delegate?.didClose()
    }
    @objc func doneTapped(){
        delegate?.didOnboarding()
    }
    
    @objc func nextTapped(_ sender: UIButton){
        guard let newxtVC = getNextViewController(from: currentVC) else {return}
        pageViewController.setViewControllers([newxtVC], direction: .forward, animated: true, completion: nil)
    }
    @objc func backTapped(_ sender: UIButton){
        guard let previousVC = getPreviousViewController(from: currentVC) else {return}
        pageViewController.setViewControllers([previousVC], direction: .forward, animated: true, completion: nil)
    }
}


