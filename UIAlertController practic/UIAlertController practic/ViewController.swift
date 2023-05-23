//
//  ViewController.swift
//  UIAlertController practic
//
//  Created by mac on 23.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var button = UIButton()
    var game = MyGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - button
        
        view.addSubview(button)
        
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        button.center = view.center
        
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.systemBlue.cgColor
        
        button.setTitle("Alert", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.red, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 23)
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
    }
    
    //MARK: Actions
    
    @objc func buttonAction() {
        showAlert()
    }

}

//MARK: Extensions

extension ViewController {
    func showAlert() {
        let alertController = UIAlertController(title: "roulette", message: "guess the number from 1 to 5", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.delegate = self
        }
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print(self.game.isRight(answer: self.game.answer))
        }
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        
        
        present(alertController, animated: true) {
            self.game.generate()
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, let number = Int(text) {
            game.answer = number
        }
    }
}


