//
//  ViewController.swift
//  SideMenuCustomized
//
//  Created by Ghadeer El-Mahdy on 20/10/2021.
//

import UIKit

class CoordinatorViewController: UIViewController {
    var sideMenuStatus: SideMenuStatus = .closed
    let controllerHandler = ViewControllersHandler.shared
    let sideMenuVC = SideMenuViewController()
    var mainNavigationController: UINavigationController?
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
        // to set the first show
        // side menu
      //  let sideMenuVC = controllerHandler.getSideMenuViewController()
        sideMenuVC.sideMenuDelegate = self
        addChild(sideMenuVC)
        view.addSubview(sideMenuVC.view)
        sideMenuVC.didMove(toParent: self)
       
        // home viewcontroller
        let menuItem = SideMenuOptions.home
        controllerHandler.selectedMenuItem = menuItem
        mainNavigationController = UINavigationController(rootViewController:   menuItem.viewController)
        addChild(mainNavigationController!)
        mainNavigationController?.didMove(toParent: self)
        addMainViewController(menuItem)
       
    }
    private func addMainViewController (_ menuItem: SideMenuOptions){
        mainNavigationController?.setViewControllers([menuItem.viewController], animated: false)
        menuItem.viewController.delegate = self
        if let  navController = menuItem.viewController.navigationController {
            view.addSubview( navController.view)
        }
        controllerHandler.selectedMenuItem = menuItem
    }
    private func removeMainViewController (_ menuItem: SideMenuOptions){
        controllerHandler.selectedMenuItem = nil
        menuItem.viewController.navigationController?.view.removeFromSuperview()
    }
}

extension CoordinatorViewController: MainParentViewControllerDelegate{
    func didTapSideMenu() {
        switch sideMenuStatus {
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) { [weak self] in
                let topVC = ViewControllersHandler.shared.selectedMenuItem?.viewController
                topVC?.navigationController?.view.frame.origin.x =  ((topVC?.view.frame.width ?? 200)/3) * 2
                topVC?.navigationController?.navigationBar.isHidden = true
                self?.sideMenuVC.menuTableView.reloadData()
              
            } completion: { [weak self] isDone in
                if isDone {
                    self?.sideMenuStatus = .opened
                }
            }

        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                let topVC = ViewControllersHandler.shared.selectedMenuItem?.viewController
                topVC?.navigationController?.view.frame.origin.x =  0
                topVC?.navigationController?.navigationBar.isHidden = false
            } completion: { [weak self] isDone in
                if isDone {
                    self?.sideMenuStatus = .closed
                }
            }
        }
    }
}
extension CoordinatorViewController: SideMenuDelegate {
    func didSelectMenuItem(menuItem: SideMenuOptions) {
        if controllerHandler.selectedMenuItem != menuItem {
            removeMainViewController(controllerHandler.selectedMenuItem ?? .home)
            addMainViewController(menuItem)
            controllerHandler.selectedMenuItem = menuItem
            menuItem.viewController.delegate?.didTapSideMenu()
        }else {
            menuItem.viewController.delegate?.didTapSideMenu()
        }
    }
}

