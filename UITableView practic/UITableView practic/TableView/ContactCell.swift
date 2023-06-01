//
//  ContactCell.swift
//  UITableView practic
//
//  Created by mac on 01.06.2023.
//

import UIKit
import SnapKit

class ContactCell: UITableViewCell {

    //MARK: - Variables

    let avatar = UIImageView()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)

        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .lightGray

        return label
    }()

    //MARK: -

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - private

    private func setupCell() {

        avatar.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.left.equalTo(contentView.snp.left).offset(16)
            make.height.width.equalTo(32)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.left.equalTo(avatar.snp.right).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-8)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.left.equalTo(avatar.snp.right).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
        }

    }

    //MARK: - public

    func configure(contact: Contact) {
        avatar.image = contact.image
        nameLabel.text = contact.name
        descriptionLabel.text = contact.description
    }

}
