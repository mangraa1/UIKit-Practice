//
//  ViewController.swift
//  StudyingUIKit
//
//  Created by mac on 08.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    
    let actionButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trueButton.layer.borderColor = UIColor.red.cgColor
        trueButton.layer.borderWidth = 1
        trueButton.layer.cornerRadius = 10
        
        view.addSubview(actionButton)
        
        actionButton.layer.borderColor = UIColor.red.cgColor
        actionButton.layer.borderWidth = 1
        actionButton.layer.cornerRadius = 10
        
        actionButton.setTitle("Действие", for: .normal)
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        actionButton.setTitleColor(.systemRed, for: .normal)
        actionButton.setTitleColor(.systemOrange, for: .highlighted)
        
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -93),
            actionButton.widthAnchor.constraint(equalToConstant: 145),
            actionButton.heightAnchor.constraint(equalToConstant: 130)])
        
        actionButton.addTarget(self, action: #selector(letAction), for: .touchUpInside)
        
    }

    @IBAction func trueAction(_ sender: Any) {
        titleLabel.text = Source.getInfo(type: .word)
    }
    
    @objc func letAction() {
        titleLabel.text = Source.getInfo(type: .action)
    }
}
