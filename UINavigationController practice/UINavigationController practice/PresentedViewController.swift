//
//  PresentedViewController.swift
//  UINavigationController practice
//
//  Created by mac on 11.06.2023.
//

import UIKit
import SnapKit

class PresentedViewController: UIViewController {

    //MARK: - Variables

    let label = UILabel(frame: .init(x: 0, y: 100, width: 300, height: 60))
    let imageView = UIImageView()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 239/255, green: 161/255, blue: 226/255, alpha: 1)

        view.addSubview(label)
        label.text = "Presented UIViewController"
        label.font = UIFont.systemFont(ofSize: 23)
        label.textAlignment = .center
        label.center.x = view.center.x

        view.addSubview(imageView)
        imageView.image = UIImage(named: "smile")
        imageView.contentMode = .scaleAspectFill

        imageView.snp.makeConstraints { make in
            make.left.right.equalTo(label)
            make.top.equalTo(label.snp.bottom).offset(70)
            make.height.equalTo(80)
        }
    }
}
