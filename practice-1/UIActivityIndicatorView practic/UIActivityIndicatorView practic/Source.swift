//
//  Source.swift
//  UIActivityIndicatorView practic
//
//  Created by mac on 28.05.2023.
//

import Foundation

struct Source {
    static private let tasks = [
        "сходить на выставку",
        "сходить в кино",
        "сходть на квест",
        "посмотреть сериал",
        "сходить на Stand Up"
    ]

    static func getTask() -> String? {
        tasks.randomElement()
    }
}
