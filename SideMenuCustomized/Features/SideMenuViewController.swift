//
//  SideMenuViewController.swift
//  SideMenuCustomized
//
//  Created by Ghadeer El-Mahdy on 20/10/2021.
//

import UIKit
protocol SideMenuDelegate {
    func didSelectMenuItem(menuItem: SideMenuViewController.SideMenuOptions)
}

class SideMenuViewController: UIViewController {
    enum SideMenuOptions: String, CaseIterable {
       case home = "Home"
       case aboutus = "About us"
       case contactus = "Contact us"
       case logout = "Logout"
       
        var sideItemLogo: String {
            switch self {
            case .home:
                return "homekit"
            case .aboutus:
                return "info.circle.fill"
            case .contactus:
                return "person.crop.circle.fill"
            case .logout:
                return "rectangle.portrait.and.arrow.right.fill"
            }
        }
    }
    private var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColors.secondaryBackgroundColor
        self.setupMenuTableView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        menuTableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top + 50, width: view.bounds.width - 150, height: view.bounds.height)
    }
    private func setupMenuTableView () {
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        self.view.addSubview(menuTableView)
    }
}
extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SideMenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = SideMenuOptions.allCases[indexPath.row].rawValue
        contentConfig.image = UIImage(systemName: SideMenuOptions.allCases[indexPath.row].sideItemLogo)
        contentConfig.textProperties.color = .white
        contentConfig.imageProperties.tintColor = .white
        cell.contentConfiguration = contentConfig
        cell.backgroundColor = AppColors.secondaryBackgroundColor
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
