//
//  CarViewController.swift
//  UIPageViewController
//
//  Created by mac on 26.06.2023.
//

import UIKit
import SnapKit

final class CarViewController: UIViewController {

    //MARK: - Image

    private let carImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()

    //MARK: - Label

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()

    private lazy var subView: [UIView] = [carImage, nameLabel]

    //MARK: - Init

    init(carWith: CarsHelper) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .lightGray

        carImage.image = carWith.image
        nameLabel.text = carWith.name

        for view in subView { self.view.addSubview(view)}

        carImage.snp.makeConstraints { make in
            make.height.width.equalTo(250)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view.center.x)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(carImage.snp.bottom).offset(50)
            make.centerX.equalTo(view.center.x)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
