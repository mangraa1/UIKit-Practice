//
//  ViewController.swift
//  UITabBarController
//
//  Created by mac on 19.06.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow

        navigationItem.title = "FirstVC"

        let tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)

        self.tabBarItem = tabBarItem
    }


}

