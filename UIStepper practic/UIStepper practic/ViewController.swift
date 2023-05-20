//
//  ViewController.swift
//  UIStepper practic
//
//  Created by mac on 19.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLabel = UILabel()
    var itemImageView = UIImageView()
    var segmentedControl = UISegmentedControl(items: ["32cm", "48cm", "52cm"])
    var descriptionLabel = UILabel()
    var stepper = UIStepper()
    var sendButton = UIButton()
    
    var itemDescription = "\"Supreme\" pizza 32 cm in quantity - 1 pcs" {
        didSet {
            descriptionLabel.text = itemDescription
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - titleLabel settings
        
        view.addSubview(titleLabel)
        
        titleLabel.text = "Pizza"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 33)

        //MARK: - itemImageView settings
        
        view.addSubview(itemImageView)
        
        itemImageView.image = UIImage(named: "pizza")
        itemImageView.layer.cornerRadius = 20
        itemImageView.clipsToBounds = true
        itemImageView.contentMode = .scaleAspectFill

        //MARK: - segmentedControl settings
        
        view.addSubview(segmentedControl)
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Arial", size: 18)!,
                                                 NSAttributedString.Key.foregroundColor : UIColor.lightGray], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Arial", size: 25)!,
                                                 NSAttributedString.Key.foregroundColor : UIColor.systemBlue], for: .selected)
        
        segmentedControl.addTarget(self, action: #selector(segmentedAction(sender:)), for: .valueChanged)

        //MARK: - descriptionLabel settings
        
        view.addSubview(descriptionLabel)
        
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = itemDescription
        descriptionLabel.font = UIFont.systemFont(ofSize: 20)

        //MARK: - stepper settings
        
        view.addSubview(stepper)
        
        stepper.minimumValue = 1
        stepper.maximumValue = 10
        stepper.value = 1
        
        stepper.addTarget(self, action: #selector(stepperAction(sender:)), for: .valueChanged)

        //MARK: - sendButton settings
        
        view.addSubview(sendButton)
        
        sendButton.setTitle("add", for: .normal)
        sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        sendButton.setTitleColor(.systemBlue, for: .normal)
        sendButton.setTitleColor(.yellow, for: .highlighted)
        sendButton.layer.cornerRadius = 15
        sendButton.backgroundColor = UIColor(red: 220/252, green: 220/252, blue: 220/252, alpha: 0.9)
        
        sendButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        //MARK:  -constraints
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        stepper.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        
            itemImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            itemImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 300),
            itemImageView.heightAnchor.constraint(equalToConstant: 300),
            
            segmentedControl.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 200),
            
            stepper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stepper.centerYAnchor.constraint(equalTo: descriptionLabel.centerYAnchor),
            
            sendButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.heightAnchor.constraint(equalToConstant: 30),
            sendButton.widthAnchor.constraint(equalToConstant: 100)])
    }
    
    //MARK: - Actions
    
    @objc func buttonAction() {
        //print("order added")
        print("New order: \(descriptionLabel.text!)")
    }
    
    @objc func stepperAction(sender: UIStepper) {
        itemDescription = "Pepperoni pizza \(segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)!) cm in quantity - \(Int(stepper.value)) pcs"
    }
    
    @objc func segmentedAction(sender: UISegmentedControl) {
        itemDescription = "Pepperoni pizza \(sender.titleForSegment(at: sender.selectedSegmentIndex)!) cm in quantity - \(Int(stepper.value)) pcs"
    }
    
}

