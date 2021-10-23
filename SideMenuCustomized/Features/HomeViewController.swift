//
//  HomeViewController.swift
//  SideMenuCustomized
//
//  Created by Ghadeer El-Mahdy on 20/10/2021.
//

import UIKit
protocol HomeViewControllerDelegate : AnyObject {
    func didTapSideMenu()
}

class HomeViewController: UIViewController {
    weak var delegate: HomeViewControllerDelegate?
    private var gradientMaskLayer: CAGradientLayer?
    private var isSideMenuOpened = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColors.mainBackgroundColor
        setupNavigationBar()
        self.setStatusBarColor(AppColors.mainBackgroundColor)
    }
    private func setupNavigationBar (){
        self.title = "Home"
        self.navigationController?.navigationBar.backgroundColor = AppColors.mainBackgroundColor
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash") , style: .plain , target: self, action: #selector(menuAction))
    }
    @objc func menuAction (){
        delegate?.didTapSideMenu()
        isSideMenuOpened.toggle()
        self.setStatusBarColor(isSideMenuOpened ? AppColors.secondaryBackgroundColor : AppColors.mainBackgroundColor)
        self.navigationController?.navigationBar.backgroundColor =  isSideMenuOpened ? AppColors.secondaryBackgroundColor : AppColors.mainBackgroundColor
        if isSideMenuOpened {
            self.view.clipsToBounds = true
            self.view.frame.origin.y = 100 
            self.view.layer.cornerRadius = 40
            view.layer.opacity = 0.5
        }else {
            self.view.frame.origin.y = 0
            self.view.layer.cornerRadius = 0
            view.layer.opacity = 1
        }
    }
//    private func setGradientMaskLayer() {
//        gradientMaskLayer = CAGradientLayer()
//        gradientMaskLayer?.frame = self.view.frame
//        gradientMaskLayer?.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
//        gradientMaskLayer?.locations = [0, 0.1, 0.9, 1]
//    }
}
