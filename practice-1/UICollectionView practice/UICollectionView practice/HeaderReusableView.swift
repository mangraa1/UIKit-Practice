//
//  HeaderReusableView.swift
//  UICollectionView practice
//
//  Created by mac on 07.06.2023.
//

import UIKit
import SnapKit

class HeaderReusableView: UICollectionReusableView {

    let titleLabel: UILabel = {
        let label = UILabel()

        label.layer.borderColor = UIColor.cyan.cgColor
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 5

        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0

        label.font = UIFont.systemFont(ofSize: 23)

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupTitle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupTitle() {
        addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(8)
            make.bottom.right.equalToSuperview().offset(-8)
        }
    }
    
}
