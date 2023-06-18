//
//  ViewController.swift
//  UINavigationViewController
//
//  Created by mac on 17.06.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let displaySecondButton = UIButton()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        createImageTitleView()

        setupDisplaySecondButton()
        
   }

    //MARK: - Methods

    fileprivate func setupDisplaySecondButton() {
        view.addSubview(displaySecondButton)
        displaySecondButton.makeButton(withText: "Jump to second VC", backgroundClor: .systemBlue, titleColor: .white)

        displaySecondButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }

        displaySecondButton.addTarget(self, action: #selector(performDisplaySecondVC), for: .touchUpInside)
    }

    @objc func performDisplaySecondVC() {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }

    fileprivate func createImageTitleView() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 35))
        imageView.contentMode = .scaleAspectFit

        let image = UIImage(named: "apple")
        imageView.image = image

        navigationItem.titleView = imageView
    }


}

