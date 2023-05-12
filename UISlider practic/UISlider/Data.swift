//
//  Data.swift
//  UISlider
//
//  Created by mac on 20.03.2023.
//

import UIKit

//class ViewController: UIViewController {
//
//    var label : UILabel!
//    var mySlider : UISlider!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        mySlider = UISlider(frame: CGRect(x: 0, y:0, width: 300, height: 90))
//        view.addSubview(mySlider)
//        mySlider.center = view.center
//
//        //mySlider.isContinuous = false
//        mySlider.minimumValue = 0
//        mySlider.maximumValue = 100
//        mySlider.value = 50
//
//        mySlider.addTarget(self, action: #selector(sliderAction(sender: )), for: .valueChanged)
//
//        mySlider.minimumTrackTintColor = .red
//        mySlider.maximumTrackTintColor = .cyan
//        mySlider.thumbTintColor = .systemPink
//
//        label = UILabel(frame: CGRect(x: 0, y: 250, width: 300, height: 100))
//        view.addSubview(label)
//        label.text = "I am label"
//        label.center.x = view.center.x
//
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        sleep(2)
//        mySlider.setValue(75, animated: true)
//
//    }
//
//    @objc func sliderAction(sender: UISlider){
//        label.text = "\(sender.value)"
//    }
//
//
//}
