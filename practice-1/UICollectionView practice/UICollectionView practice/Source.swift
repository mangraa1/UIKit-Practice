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

    let id: String
    let imageName: String

    init(id: String, imageName: String) {
        self.id = id
        self.imageName = imageName
    }
}

struct SectionPhoto {
    let sectionName: String
    var photos: [Photo]
}

struct Source {
    static func allPeople() -> [String] {
        ["Alex", "Kim", "Michael", "Anna", "Sam", "Boris"]
    }

    static func makePhoto(name: String) -> Photo {
        .init(id: UUID().uuidString, imageName: name)
    }

    static func randomPhotos(with count: Int) -> [Photo] {
        return (0..<count).map { _ in
            let name = allPeople().randomElement()
            return makePhoto(name: name!)
        }
    }
}
