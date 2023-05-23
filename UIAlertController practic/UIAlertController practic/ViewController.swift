//
//  ViewController.swift
//  UIAlertController practic
//
//  Created by mac on 23.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: button
        
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
    
    @objc func buttonAction() {
        showAlert()
    }

}


extension ViewController {
    func showAlert() {
        let alertController = UIAlertController(title: "Title", message: "so long message", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print("Ok action")
        }
        alertController.addAction(okAction)
        
        let destroyAction = UIAlertAction(title: "Destroy", style: .destructive)
        alertController.addAction(destroyAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true) {
            print("alert controller is presented")
        }
    }
}
