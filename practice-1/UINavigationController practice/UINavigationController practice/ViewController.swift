//
//  ViewController.swift
//  UINavigationController practice
//
//  Created by mac on 11.06.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    //MARK: - Variables

    let pushButton = UIButton()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        configurePushButton()
    }
}

//MARK: - Extensions

extension ViewController {
    func configurePushButton() {
        view.addSubview(pushButton)

        pushButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY).offset(-40)
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        pushButton.makeMeButton(to: "Push", withColor: .systemPink)

        pushButton.addTarget(self, action: #selector(pushButtonAction), for: .touchUpInside)
    }

    @objc func pushButtonAction() {
        let controller = OnePushViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension UIButton {

    func makeMeButton(to text: String, withColor color: UIColor) {
        self.setTitle(text, for: .normal)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = color
    }
}


