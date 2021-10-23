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
}
