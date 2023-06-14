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

    var source: [SectionPhoto] = [
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
        collectionView.dragInteractionEnabled = true
        collectionView.dragDelegate = self
        collectionView.dropDelegate = self

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
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let alert = UIAlertController(title: "select", message: "section: \(indexPath.section + 1)  item: \(indexPath.item + 1)", preferredStyle: .alert)
         let okAction = UIAlertAction(title: "ok", style: .default)
         alert.addAction(okAction)
         self.present(alert, animated: true)
     }
 }

extension ViewController: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let photo = source[indexPath.section].photos[indexPath.item]

        let itemProvider = NSItemProvider(object: photo)

        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = photo

        return [dragItem]
    }

    func collectionView(_ collectionView: UICollectionView, dragSessionWillBegin session: UIDragSession) {
        UIView.animate(withDuration: 0.2) {
            self.button.alpha = 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, dragSessionDidEnd session: UIDragSession) {
        UIView.animate(withDuration: 0.2) {
            self.button.alpha = 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        let photo = source[indexPath.section].photos[indexPath.item]

        let itemProvider = NSItemProvider(object: photo)

        let dragItem = UIDragItem(itemProvider: itemProvider)

        return [dragItem]
    }
}

extension ViewController: UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {

        guard let _ = destinationIndexPath else { return .init(operation: .forbidden) }

        return .init(operation: .move, intent: .insertAtDestinationIndexPath)
    }

    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {

        guard let destinationIndexPath = coordinator.destinationIndexPath else { return }

        for item in coordinator.items {
            guard let photo = item.dragItem.localObject as? Photo else { continue }
            guard let sourceIndexPath = item.sourceIndexPath else { continue }

            collectionView.performBatchUpdates {
                move(photo: photo, to: destinationIndexPath)
                collectionView.moveItem(at: sourceIndexPath, to: destinationIndexPath)
            }
        }

        for item in coordinator.items {
            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
        }
    }

    func move(photo: Photo, to indexPath: IndexPath) {
        var newPhotos = [Photo]()
        var sections = [SectionPhoto]()

        for section in source {
            newPhotos = section.photos.filter { return $0.id != photo.id }
            sections.append(.init(sectionName: section.sectionName, photos: newPhotos))
        }

        sections[indexPath.section].photos.insert(photo, at: indexPath.item)
        source = sections
    }

}
