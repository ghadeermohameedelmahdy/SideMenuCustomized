//
//  SideMenuOptions.swift
//  SideMenuCustomized
//
//  Created by Ghadeer El-Mahdy on 23/10/2021.
//

import Foundation
import UIKit
enum SideMenuOptions: String, CaseIterable {
   case home = "Home"
   case aboutus = "About us"
   case contactus = "Contact us"
   case settings = "Settings"
   
    var sideItemLogo: String {
        switch self {
        case .home:
            return "homekit"
        case .aboutus:
            return "info.circle.fill"
        case .contactus:
            return "person.crop.circle.fill"
        case .settings:
            return "rectangle.portrait.and.arrow.right.fill"
        }
    }
    var viewController: MainParentViewController {
        let handler = ViewControllersHandler.shared
        switch self {
        case .home:
            return handler.getHomeViewController()
        case .aboutus:
            return handler.getInfoViewController()
        case .contactus:
            return handler.getContactusViewController()
        case .settings:
            return handler.getSettingsViewController()
        }
    }
}
