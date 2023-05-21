//
//  ViewController.swift
//  UITextField practic
//
//  Created by mac on 21.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var login: UITextField!
    
    var password = UITextField()
    var validator = Validator()
    var storage = Storage.initial
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Login
        
        login.delegate = self
        
        //MARK: - Password
        
        view.addSubview(password)
        password.delegate = self
        
        password.borderStyle = .roundedRect
        password.isSecureTextEntry = true
        password.keyboardAppearance = .dark
        password.clearButtonMode = .always
        
        password.placeholder = " enter password"
        password.font = UIFont.systemFont(ofSize: 20)
        
        //MARK: - Constraints
        
        password.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            password.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 30),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)])
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == login {
            password.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case login:
            break
        case password:
            return validator.hasNumbers(text: string)
        default:
            break
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return textField.isEditing
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == login {
            storage.login = textField.text!
        } else {
            storage.password = textField.text!
            print(storage.login, storage.password)
        }
    }
}

