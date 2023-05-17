//
//  ViewController.swift
//  UISlider practic
//
//  Created by mac on 16.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var commonAmountLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    @IBOutlet weak var amountSlider: UISlider!
    @IBOutlet weak var periodSlider: UISlider!
    @IBOutlet weak var percentSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountLabel.text = "10 000 грн."
        periodLabel.text = "5 місяців"
        percentLabel.text = "5 %"
        
        setCommonAmount()
    }
    
    @IBAction func amountSliderAction(_ sender: UISlider) {
        switch sender.tag {
        case 0: amountLabel.text = "\(Int(sender.value)) грн."
        case 1: periodLabel.text = "\(Int(sender.value)) місяців"
        case 2: percentLabel.text = "\(Int(sender.value)) %"
        default: return
        }
        
        setCommonAmount()
    }
    
    func setCommonAmount() {
        let percentAmount = amountSlider.value / 100 * percentSlider.value / 12
        let periodAmount = percentAmount * periodSlider.value
        commonAmountLabel.text = "\(amountSlider.value + periodAmount) грн."
    }
    
}

