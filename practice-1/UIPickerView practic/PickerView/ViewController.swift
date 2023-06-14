//
//  ViewController.swift
//  PickerView
//
//  Created by mac on 17.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var picker: UIPickerView!
    var imageView: UIImageView!
    var label: UILabel!
    
    let timeOfTheYear = ["summer", "winter"]
    let summerPhoto = ["beautiful", "street", "motorcycle", "flower"]
    let winterPhoto = ["swing", "child", "rink"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: picker settings
        
        picker = UIPickerView()
        view.addSubview(picker)
        picker.center.x = view.center.x
        picker.center.y = view.center.y + 260
        picker.delegate = self
        picker.dataSource = self
        
        
        //MARK: imageView settings
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 150, width: view.frame.width - 50, height: view.frame.height / 2))
        view.addSubview(imageView)
        imageView.center.x = view.center.x
        imageView.contentMode = .scaleAspectFit
        setImage(name: "beautiful")
        
        imageView.layer.shadowColor = UIColor.red.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOpacity = 15
        
        
        //MARK: label settings
        
        label = UILabel(frame: CGRect(x: 0, y: 65, width: view.frame.width, height: 50))
        view.addSubview(label)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 27)
        label.text = "Choose a photo"
        label.textColor = .systemBlue
        
        
    }
    
    func setImage(name: String) {
        guard let newImage = UIImage(named: name) else {return}
        imageView.image = newImage
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return timeOfTheYear.count
        } else {
            return summerPhoto.count > winterPhoto.count ? winterPhoto.count : summerPhoto.count
        }
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return timeOfTheYear[row]
        } else {
            if pickerView.selectedRow(inComponent: 0) == 0 {
                return summerPhoto[row]
            } else {
                return winterPhoto[row]
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            pickerView.reloadComponent(1)
            if pickerView.selectedRow(inComponent: 0) == 0 {
                setImage(name: summerPhoto[pickerView.selectedRow(inComponent: 1)])
            } else {
                setImage(name: winterPhoto[pickerView.selectedRow(inComponent: 1)])
            }
        } else {
            if pickerView.selectedRow(inComponent: 0) == 0 {
                setImage(name: summerPhoto[row])
            } else {
                setImage(name: winterPhoto[row])
            }
        }
    }
}

