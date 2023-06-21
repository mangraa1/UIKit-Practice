//
//  ViewController.swift
//  NSNotificationCenter
//
//  Created by mac on 21.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(setImageViewToRed), name: NSNotification.Name(rawValue: "red"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setImageViewToBlue), name: NSNotification.Name(rawValue: "blue"), object: nil)
    }

    @objc func setImageViewToRed() {
        imageView.backgroundColor = .red
    }

    @objc func setImageViewToBlue() {
        imageView.backgroundColor = .blue
    }

}

