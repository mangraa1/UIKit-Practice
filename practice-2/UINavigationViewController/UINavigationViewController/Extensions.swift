//
//  Extensions.swift
//  UINavigationViewController
//
//  Created by mac on 18.06.2023.
//

import UIKit
import SnapKit

extension UIButton {
    func makeButton(withText text: String, backgroundClor: UIColor, titleColor: UIColor) {

        self.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(55)
        }

        self.setTitle(text, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20)

        self.backgroundColor = backgroundClor
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 2
    }
}
