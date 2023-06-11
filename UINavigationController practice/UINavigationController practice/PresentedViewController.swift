//
//  PresentedViewController.swift
//  UINavigationController practice
//
//  Created by mac on 11.06.2023.
//

import Foundation
import UIKit

class PresentedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

        let label = UILabel(frame: .init(origin: .init(x: 60, y: 100), size: .init(width: 300, height: 300)))

        view.addSubview(label)
        label.text = "Presented UIViewController"
        label.textAlignment = .center
    }
}
