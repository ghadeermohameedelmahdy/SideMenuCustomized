//
//  SideMenuViewController.swift
//  SideMenuCustomized
//
//  Created by Ghadeer El-Mahdy on 20/10/2021.
//

import UIKit
protocol SideMenuDelegate: AnyObject {
    func didSelectMenuItem(menuItem: SideMenuOptions)
}

class SideMenuViewController: UIViewController {
    var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
        tableView.isUserInteractionEnabled = true
        return tableView
    }()
    weak var sideMenuDelegate: SideMenuDelegate?
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
        let menuItem = SideMenuOptions.allCases[indexPath.row]
        let isCellSelected = ViewControllersHandler.shared.selectedMenuItem?.rawValue == menuItem.rawValue
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = menuItem.rawValue
        contentConfig.image = UIImage(systemName: SideMenuOptions.allCases[indexPath.row].sideItemLogo)
        contentConfig.textProperties.color = isCellSelected ? AppColors.secondaryBackgroundColor : .white
        contentConfig.imageProperties.tintColor = isCellSelected ? AppColors.secondaryBackgroundColor : .white
        cell.contentConfiguration = contentConfig
        cell.backgroundColor = isCellSelected ? .white : AppColors.secondaryBackgroundColor
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let menuItem = SideMenuOptions.allCases[indexPath.row]
        menuItem.viewController.sideMenuClosedHandle()
        sideMenuDelegate?.didSelectMenuItem(menuItem: menuItem)
    }
    
}
