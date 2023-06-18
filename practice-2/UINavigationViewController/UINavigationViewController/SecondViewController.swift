//
//  SecondViewController.swift
//  UINavigationViewController
//
//  Created by mac on 18.06.2023.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {

    let popToRootButton = UIButton()
    let presentedPushButton = UIButton()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Second VC"
        view.backgroundColor = .lightGray

        configurePopToRootButton()
        configurePushButton()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        self.perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }

    //MARK: - Custom functions

    func configurePopToRootButton() {
        view.addSubview(popToRootButton)
        popToRootButton.makeButton(withText: "Pop", backgroundClor: .systemRed, titleColor: .white)

        popToRootButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY).offset(-40)
        }

        popToRootButton.addTarget(self, action: #selector(performDisplayVC), for: .touchUpInside)
    }

    func configurePushButton() {
        view.addSubview(presentedPushButton)
        presentedPushButton.makeButton(withText: "Presented", backgroundClor: .systemBlue, titleColor: .yellow)

        presentedPushButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY).offset(40)
        }

        presentedPushButton.addTarget(self, action: #selector(presentedVC), for: .touchUpInside)
    }

    //MARK: - Methods

    @objc func performDisplayVC() {
        navigationController?.popViewController(animated: true)
    }

    @objc func presentedVC() {
        let controller = PresentedViewController()
        present(controller, animated: true)
    }

    @objc func goBack() {
        dismiss(animated: true, completion: nil)
    }

}
