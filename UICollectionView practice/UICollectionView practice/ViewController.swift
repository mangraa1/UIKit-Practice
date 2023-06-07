//
//  ViewController.swift
//  UICollectionView practice
//
//  Created by mac on 06.06.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    //MARK: - Variables

    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!
    let button = UIButton()

//    let source = Source.randomPhotos(with: 15)
    let source: [SectionPhoto] = [
        SectionPhoto(sectionName: "First section", photos: Source.randomPhotos(with: 15)),
        SectionPhoto(sectionName: "Second section", photos: Source.randomPhotos(with: 15))
    ]

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        setupButton()
    }

    //MARK: - Custom functions

    func setupCollectionView() {

        layout = setupFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        view.addSubview(collectionView)

        collectionView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
        }
        collectionView.dataSource = self

        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "\(PhotoCell.self)")
        collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HeaderReusableView.self)")
    }

    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()

        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize

        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10

        layout.sectionInset = .init(top: 30, left: 30, bottom: 30, right: 30)

        layout.headerReferenceSize = .init(width: view.frame.size.width, height: 60)

        return layout
    }

    func setupButton() {
        view.addSubview(button)

        button.setTitle("Change", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)

        button.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(8)
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(64)
        }

        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    @objc func buttonAction() {
        layout.scrollDirection = layout.scrollDirection == .horizontal ? .vertical : .horizontal

        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
}

//MARK: - Extensions

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        source.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        source[section].photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoCell.self)", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }

//        cell.imageView.image = UIImage(named: source[indexPath.item].imageName)
        cell.imageView.image = UIImage(named: source[indexPath.section].photos[indexPath.item].imageName)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(HeaderReusableView.self)", for: indexPath) as? HeaderReusableView else {
                return UICollectionReusableView()
            }
            view.titleLabel.text = source[indexPath.section].sectionName
            return view

        default: return UICollectionReusableView()
        }
    }
}
