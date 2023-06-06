//
//  Source.swift
//  UICollectionView practice
//
//  Created by mac on 06.06.2023.
//

import Foundation

struct Photo {
    let id: Int
    let imageName: String
}

struct SectionPhoto {
    let sectionName: String
    var photos: [Photo]
}

struct Source {
    static func allPhotos() -> [Photo] {
        [
            .init(id: 1, imageName: "Alex"),
            .init(id: 2, imageName: "Kim"),
            .init(id: 3, imageName: "Michael"),
            .init(id: 4, imageName: "Anna"),
            .init(id: 5, imageName: "Sam"),
            .init(id: 6, imageName: "Boris")
        ]
    }

    static func randomPhotos(with count: Int) -> [Photo] {
        return (0..<count).map { _ in allPhotos().randomElement()!}
    }
}
