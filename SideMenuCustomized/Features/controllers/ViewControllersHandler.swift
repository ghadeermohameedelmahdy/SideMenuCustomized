//
//  ViewControllersHandler.swift
//  SideMenuCustomized
//
//  Created by Ghadeer El-Mahdy on 23/10/2021.
//

import Foundation

class ViewControllersHandler {
    static let shared = ViewControllersHandler()
    private init (){}
    private lazy var homeViewController = HomeViewController()
    private lazy var infoViewController = InfoViewController()
    private lazy var contactusViewController = ContactusViewController()
    private lazy var settingsViewController = SettingsViewController()
    var selectedMenuItem: SideMenuOptions?
    
    func getHomeViewController () -> HomeViewController {
        return homeViewController
    }
    func getInfoViewController () -> InfoViewController {
        return infoViewController
    }
    func getContactusViewController () -> ContactusViewController {
        return contactusViewController
    }
    
    func getSettingsViewController () -> SettingsViewController {
        return settingsViewController
    }
}
