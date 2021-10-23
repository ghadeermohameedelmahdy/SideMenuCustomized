//
//  UIViewControllerExt.swift
//  SideMenuCustomized
//
//  Created by Ghadeer El-Mahdy on 20/10/2021.
//

import Foundation
import UIKit
extension UIViewController {
    func setStatusBarColor(_ color: UIColor){
        let statusBar =  UIView()
         statusBar.frame = UIApplication.shared.statusBarFrame
         statusBar.backgroundColor = color
         UIApplication.shared.keyWindow?.addSubview(statusBar)
    }
    func sideMenuOpenedHandle (){
        self.view.clipsToBounds = true
        self.view.frame.origin.y = 100
        self.view.layer.cornerRadius = 40
        view.layer.opacity = 0.5
        self.setStatusBarColor(AppColors.secondaryBackgroundColor )
        self.navigationController?.navigationBar.backgroundColor = AppColors.secondaryBackgroundColor
    }
    func sideMenuClosedHandle (){
        self.view.frame.origin.y = 0
        self.view.layer.cornerRadius = 0
        view.layer.opacity = 1
        self.setStatusBarColor(AppColors.mainBackgroundColor)
        self.navigationController?.navigationBar.backgroundColor = AppColors.mainBackgroundColor
    }
}
