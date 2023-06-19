//
//  SecondViewController.swift
//  UITabBarController
//
//  Created by mac on 19.06.2023.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        navigationItem.title = "SecondVC"

        let tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)

        self.tabBarItem = tabBarItem
    }

}
