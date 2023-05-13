//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by mac on 18.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var heroImageView: UIImageView!
    var segmentedControl : UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let heroes = ["Iron Man", "Capitan America", "Black Panter"]
        segmentedControl = UISegmentedControl(items: heroes)
        
        heroImageView.contentMode = .scaleAspectFit
        let marvel = UIImage(named: "Marvel")
        heroImageView.image = marvel
        
        segmentedControl.apportionsSegmentWidthsByContent = true
        segmentedControl.selectedSegmentTintColor = .systemBlue
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Arial", size: 13)!,
                                                 NSAttributedString.Key.foregroundColor : UIColor.lightGray], for: .normal)
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Arial", size: 19)!,
                                                 NSAttributedString.Key.foregroundColor : UIColor.yellow], for: .selected)
        
        segmentedControl.addTarget(self, action: #selector(segmentedAction(sender:)), for: .valueChanged)
        view.addSubview(segmentedControl)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 60),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            segmentedControl.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    @objc func segmentedAction(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: changeHero(for: "Iron Man")
        case 1: changeHero(for: "Capitan America")
        case 2: changeHero(for: "Black Panter")
        default: break
        }
    }
    
    func changeHero (for image: String){
        UIView.animate(withDuration: 0.5, animations: {
            self.heroImageView.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.5) {
                self.heroImageView.alpha = 1
                self.heroImageView.image = UIImage(named: image)
            }
        }
    }
    
}
