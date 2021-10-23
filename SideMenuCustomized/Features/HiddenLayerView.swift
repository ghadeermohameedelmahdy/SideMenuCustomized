//
//  HiddenLayerView.swift
//  SideMenuCustomized
//
//  Created by Ghadeer El-Mahdy on 21/10/2021.
//

import UIKit

class HiddenLayerView: UIView {
    let gradient = CAGradientLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
       // self.backgroundColor = .systemGray5
        self.isOpaque = false

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func showLayerView (parentViewFrame: CGRect) {
        let origin = parentViewFrame.origin
        frame = CGRect(x: origin.x - 5, y: origin.y + 80, width:  parentViewFrame.width, height:  parentViewFrame.height - 60)
        gradient.frame = bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        layer.insertSublayer(gradient, at: 0)
        self.layer.cornerRadius = 40
        self.clipsToBounds = true
    }
}
