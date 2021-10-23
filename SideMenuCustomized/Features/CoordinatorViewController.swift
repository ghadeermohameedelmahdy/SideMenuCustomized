//
//  ViewController.swift
//  SideMenuCustomized
//
//  Created by Ghadeer El-Mahdy on 20/10/2021.
//

import UIKit

class CoordinatorViewController: UIViewController {
    var sideMenuStatus: SideMenuStatus = .closed
    let sideMenuVC = SideMenuViewController()
    let homeVC = HomeViewController()
    var homeNavigationController: UINavigationController?
    enum SideMenuStatus {
        case closed
        case opened
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = AppColors.secondaryBackgroundColor
        addChildVCs()
    }
    private func addChildVCs () {
        // side menu
        addChild(sideMenuVC)
        view.addSubview(sideMenuVC.view)
        sideMenuVC.didMove(toParent: self)
        
        // home viewcontroller
       
        let homeNavigation = UINavigationController(rootViewController: homeVC)
        homeVC.delegate = self
        addChild(homeNavigation)
        view.addSubview(homeNavigation.view)
        homeNavigation.didMove(toParent: self)
        homeNavigationController = homeNavigation
    }
}
extension CoordinatorViewController: HomeViewControllerDelegate {
    func didTapSideMenu() {
        switch sideMenuStatus {
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                print(self.homeVC.view.frame.origin)
                self.homeVC.view.frame.origin.x =  self.homeVC.view.frame.width - 150
                self.homeNavigationController?.navigationBar.isHidden = true
                print(self.homeVC.view.frame.origin)
            } completion: { [weak self] isDone in
                if isDone {
                    self?.sideMenuStatus = .opened
                }
            }

        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.homeVC.view.frame.origin.x = 0
                self.homeNavigationController?.navigationBar.isHidden = false
            } completion: { [weak self] isDone in
                if isDone {
                    self?.sideMenuStatus = .closed
                }
            }
        }
    }
}

