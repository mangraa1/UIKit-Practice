//
//  Validator.swift
//  UITextField practic
//
//  Created by mac on 21.05.2023.
//

struct Validator {
    let numbers = "1234567890"
    
    func hasNumbers(text: String) -> Bool {
        return text.contains(where: numbers.contains)
    }
}
