//
//  TwoPushViewController.swift
//  UINavigationController practice
//
//  Created by mac on 12.06.2023.
//

import UIKit

class TwoPushViewController: UIViewController {

    //MARK: - Variables

    let popToRootButton = UIButton()
    let presentedPushButton = UIButton()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 182/255, green: 239/255, blue: 254/255, alpha: 1)

        configirePopToRootButton()
        configurePresentedPushButton()
    }
}

//MARK: - Extentions

extension TwoPushViewController {
    func configirePopToRootButton() {
        view.addSubview(popToRootButton)

        popToRootButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY).offset(-40)
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        popToRootButton.makeMeButton(to: "Pop", withColor: .systemBlue)

        popToRootButton.addTarget(self, action: #selector(popToRootAction), for: .touchUpInside)
    }

    @objc func popToRootAction() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension TwoPushViewController {
    func configurePresentedPushButton() {
        view.addSubview(presentedPushButton)

        presentedPushButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY).offset(40)
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        presentedPushButton.makeMeButton(to: "Presented", withColor: .systemPink)

        presentedPushButton.addTarget(self, action: #selector(presentedPushButtonAction), for: .touchUpInside)
    }

    @objc func presentedPushButtonAction() {
        let controller = PresentedViewController()
        present(controller, animated: true)
    }
}
