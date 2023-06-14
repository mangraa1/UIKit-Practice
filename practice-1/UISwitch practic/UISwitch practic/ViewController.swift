//
//  ViewController.swift
//  UISwitch practic
//
//  Created by mac on 16.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let mySwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: segmentedControl settings
        
        segmentedControl.alpha = 0
        
        segmentedControl.selectedSegmentTintColor = .systemBlue
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Arial", size: 18)!, NSAttributedString.Key.foregroundColor : UIColor.lightGray], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Arial", size: 30)!, NSAttributedString.Key.foregroundColor : UIColor.yellow], for: .selected)
        
        
        // MARK: mySwitch settings
        
        view.addSubview(mySwitch)
        
        mySwitch.onTintColor = .systemBlue
        mySwitch.thumbTintColor = .yellow
        
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mySwitch.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            mySwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        mySwitch.addTarget(self, action: #selector(switchAction(sender:)), for: .valueChanged)
        
        
        // MARK: sendButton settings
        
        sendButton.alpha = 0
        
    }

    @objc func switchAction(sender: UISwitch) {
        if sender .isOn {
            UIView.animate(withDuration: 0.5) {
                self.segmentedControl.alpha = 1
                self.sendButton.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.segmentedControl.alpha = 0
                self.sendButton.alpha = 0
            }
        }
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        print("your app has been rated \(segmentedControl.selectedSegmentIndex + 1)")
    }
    
    
}

