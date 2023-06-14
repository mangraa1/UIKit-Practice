//
//  Source.swift
//  UITableView practic
//
//  Created by mac on 01.06.2023.
//

import Foundation
import UIKit

struct Contact {
    let name: String
    let image: UIImage
    let description: String
    let gender: Gender
}

enum Gender {
    case male
    case female
}

struct ImageName {
    static let person = "person"
    static let fillPerson = "person.fill"
}

struct Description {
    static let descriptionMale = "friendly man"
    static let descriptionFemale = "friendly women"
}

struct Source {
    static func makeContacts() -> [Contact] {
        let femaleNames = ["Anna", "Isla", "Luna", "Iris", "Katrin", "Sol", "Amiri", "Carla"]
        let maleNames = ["William", "Lucas", "Kayce", "Zen", "Eren", "Jrue"]
        var contacts = [Contact]()

        for name in femaleNames {
            let newContact = Contact(name: name, image: .init(systemName: ImageName.person)!, description: Description.descriptionFemale, gender: Gender.female)
            contacts.append(newContact)
        }

        for name in maleNames {
            let newContact = Contact(name: name, image: .init(systemName: ImageName.fillPerson)!, description: Description.descriptionMale, gender: Gender.male)
            contacts.append(newContact)
        }
 
        return contacts
    }

    static func makeContactsWithGroup() -> [[Contact]] {
        let male = makeContacts().filter { $0.gender == .male }
        let female = makeContacts().filter { $0.gender == .female }

        return [male, female]
    }
}


