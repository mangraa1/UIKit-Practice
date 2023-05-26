//
//  ViewController.swift
//  UIStackView practic
//
//  Created by mac on 24.05.2023.
//

import UIKit

class ViewController: UIViewController {

    var label = UILabel()
    var percents = [0, 5, 10, 15, 20, 25]
    var sum = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - label

        view.addSubview(label)

        label.text = "price with diskount"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)

        //MARK: - textField
        
        let textField = UITextField()
        view.addSubview(textField)
        
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 15
        textField.addTarget(self, action: #selector(textFieldAction(sender:)), for: .editingChanged)
        
        //MARK: - stackView in scrollView
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.showsHorizontalScrollIndicator = false
        
        let stackView = UIStackView(arrangedSubviews: percents.map {makeButton(with: $0)})
        stackView.spacing = 15
        
        scrollView.addSubview(stackView)
        
        //MARK: - Constraints

        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            label.heightAnchor.constraint(equalToConstant: 40),

            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            scrollView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.heightAnchor.constraint(equalToConstant: 40),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
        
    }
    
    func makeButton(with percent: Int) -> UIButton {
        let button = UIButton()
        
        button.setTitle("discount \(percent) %", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        
        button.tag = percent
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
        return button
    }

    //MARK: - Actions
    
    @objc func textFieldAction(sender: UITextField) {
        sum = Double(sender.text!)!
    }
    
    @objc func buttonAction(sender: UIButton) {
        let finishPrice = sum - sum / 100 * Double(sender.tag)
        label.text = String(finishPrice)
        
        UIView.animate(withDuration: 0.25, animations: {
            sender.isHidden = true
        })
    }

}

