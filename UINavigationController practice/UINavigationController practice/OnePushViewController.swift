//
//  OnePushViewController.swift
//  UINavigationController practice
//
//  Created by mac on 12.06.2023.
//

import UIKit

class OnePushViewController: UIViewController {

    //MARK: - Variables

    let pushButton = UIButton()
    let popButton = UIButton()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

        configurePushButton()
        configurePopButton()

        navigationItem.setHidesBackButton(true, animated: false)
    }
}

//MARK: - Extensions

extension OnePushViewController {
    func configurePushButton() {
        view.addSubview(pushButton)

        pushButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY).offset(-40)
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        pushButton.makeMePushButton()

        pushButton.addTarget(self, action: #selector(pushButtonAction), for: .touchUpInside)
    }

    @objc func pushButtonAction() {
        let controller = TwoPushViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension OnePushViewController {
    func configurePopButton() {
        view.addSubview(popButton)

        popButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY).offset(40)
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        popButton.makeMePopButton()

        popButton.addTarget(self, action: #selector(popButtonAction), for: .touchUpInside)
    }

    @objc func popButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
