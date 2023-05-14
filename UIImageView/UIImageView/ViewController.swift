//
//  ViewController.swift
//  UIImageView
//
//  Created by mac on 14.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        
//        let image = UIImage(named: "3")
//        let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1200px-Cat03.jpg")!
//        let data = try! Data(contentsOf: imageURL)
//        let image = UIImage(data: data)
        
        imageView.animationDuration = 12
        imageView.animationImages = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!]
        imageView.startAnimating()
        
        animation()
    }
    
    func animation() {
        UIView.animate(withDuration: 2, delay: 2, options: [.repeat, .autoreverse, .curveEaseIn], animations: {
            self.imageView.alpha = 0
            
        })
    }


}

