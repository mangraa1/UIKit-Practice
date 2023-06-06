//
//  PhotoCell.swift
//  UICollectionView practice
//
//  Created by mac on 06.06.2023.
//

import UIKit
import SnapKit

class PhotoCell: UICollectionViewCell {

    let imageView = UIImageView()

    //MARK: - Initializations

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Custom functions

    func setup() {
        self.contentView.addSubview(imageView)

        imageView.contentMode = .scaleAspectFill

        self.clipsToBounds = true

        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(150)
            make.edges.equalTo(contentView)
        }
    }
}