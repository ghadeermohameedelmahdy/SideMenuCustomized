//
//  HomeViewController.swift
//  SideMenuCustomized
//
//  Created by Ghadeer El-Mahdy on 20/10/2021.
//

import UIKit
protocol MainParentViewControllerDelegate : AnyObject {
    func didTapSideMenu()
}

class MainParentViewController: UIViewController {
    weak var delegate: MainParentViewControllerDelegate?
    private var isSideMenuOpened = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColors.mainBackgroundColor
        setupNavigationBar()
        self.setStatusBarColor(AppColors.mainBackgroundColor)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sideMenuClosedHandle()
    }
    private func setupNavigationBar (){
        self.navigationController?.navigationBar.backgroundColor = AppColors.mainBackgroundColor
        let listIcon = UIImage(systemName: "list.dash")
        listIcon?.withTintColor(.white)
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:  listIcon, style: .plain , target: self, action: #selector(menuAction))
    }
    @objc func menuAction (){
        delegate?.didTapSideMenu()
        // to handle view controller ui
        sideMenuOpenedHandle()
    }
   
}
