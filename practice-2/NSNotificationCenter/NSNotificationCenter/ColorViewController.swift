//
//  ColorViewController.swift
//  NSNotificationCenter
//
//  Created by mac on 21.06.2023.
//

import UIKit

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func redColorPressed(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "red"), object: nil)
    }

    @IBAction func blueColorPressed(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "blue"), object: nil)
    }

}
