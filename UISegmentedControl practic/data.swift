//
//  data.swift
//  UISegmentedControl
//
//  Created by mac on 19.03.2023.
//


import UIKit
//
//class ViewController: UIViewController {
//
//    var segmentedControl : UISegmentedControl!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let titles = ["first", "second", "third"]
//        segmentedControl = UISegmentedControl(items: titles)
//
//        segmentedControl.insertSegment(withTitle: "four", at: 3, animated: true)
//
//        segmentedControl.setTitle("one", forSegmentAt: 0)
//        print(segmentedControl.titleForSegment(at: 1)!)
//
//        segmentedControl.setImage(UIImage(systemName: "circle"), forSegmentAt: 0)
//        segmentedControl.selectedSegmentIndex = 2
//        segmentedControl.selectedSegmentTintColor = UIColor.red
//
//
//        //segmentedControl.setWidth(50, forSegmentAt: 1)
//        segmentedControl.setTitle("so long segment", forSegmentAt: 3)
//        segmentedControl.apportionsSegmentWidthsByContent = true
//
//        print(segmentedControl.numberOfSegments)
//
//        segmentedControl.addTarget(self, action: #selector(segmentAction), for: .valueChanged)
//
//        view.addSubview(segmentedControl)
//        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
//            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)])
//
//    }
//
//    @objc func segmentAction(sender: UISegmentedControl) {
//        print(sender.titleForSegment(at: sender.selectedSegmentIndex) as Any)
//    }
//}
