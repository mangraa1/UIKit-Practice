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

    let sourse = Source.randomPhotos(with: 15)

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }

    //MARK: - Custom functions

    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())

        view.addSubview(collectionView)

        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        collectionView.dataSource = self

        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "\(PhotoCell.self)")
    }

    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()

        layout.itemSize = .init(width: 100, height: 100)

        return layout
    }

}

//MARK: - Extensions

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sourse.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoCell.self)", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }

        cell.imageView.image = UIImage(named: sourse[indexPath.item].imageName)

        return cell
    }
}
