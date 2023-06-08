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

    let source: [SectionPhoto] = [
        SectionPhoto(sectionName: "First section", photos: Source.randomPhotos(with: 6)),
        SectionPhoto(sectionName: "Second section", photos: Source.randomPhotos(with: 6))
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
        collectionView.delegate = self

        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "\(PhotoCell.self)")
        collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HeaderReusableView.self)")
    }

    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()

        layout.itemSize = .init(width: 100, height: 100)

        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10

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

extension ViewController: UICollectionViewDelegate {
     func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
         true
     }

     func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
         let cell = collectionView.cellForItem(at: indexPath)
         cell?.contentView.backgroundColor = .cyan
     }

     func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
         let cell = collectionView.cellForItem(at: indexPath)
         cell?.contentView.backgroundColor = .clear
     }

     func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
         true
     }

     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let alert = UIAlertController(title: "select", message: "section: \(indexPath.section + 1)  item: \(indexPath.item + 1)", preferredStyle: .actionSheet)
         let okAction = UIAlertAction(title: "ok", style: .default)
         alert.addAction(okAction)
         self.present(alert, animated: true)
     }

     func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
         print("deselect \(indexPath.section) - \(indexPath.item)")
     }

     func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
         let lastSection = source.count - 1
         let lastItem = source[lastSection].photos.count - 1

         let lastIndexPath = IndexPath(item: lastItem, section: lastSection)

         if indexPath == lastIndexPath {
             print("willDisplay worked")
         }
     }

    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("End display cell \(indexPath.section) - \(indexPath.item)")
    }
 }
