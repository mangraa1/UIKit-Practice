//
//  Source.swift
//  UICollectionView practice
//
//  Created by mac on 06.06.2023.
//

import Foundation

class Photo: NSObject, NSItemProviderWriting {
    static var writableTypeIdentifiersForItemProvider: [String] {
        ["Photo"]
    }

    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping @Sendable (Data?, Error?) -> Void) -> Progress? {
        nil
    }

    let id: Int
    let imageName: String

    init(id: Int, imageName: String) {
        self.id = id
        self.imageName = imageName
    }
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
