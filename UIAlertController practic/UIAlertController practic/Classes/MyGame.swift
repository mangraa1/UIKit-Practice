//
//  MyGame.swift
//  UIAlertController practic
//
//  Created by mac on 23.05.2023.
//

class MyGame {
    var answer: Int
    var secret: Int
    
    init() {
        answer = 0
        secret = 0
    }
    
    func generate() {
        secret = Int.random(in: 1...5)
    }
    
    func isRight(answer: Int) -> Bool {
        secret == answer
    }
}
