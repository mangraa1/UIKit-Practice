//
//  ViewController.swift
//  UIDatePicker practic
//
//  Created by mac on 18.05.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var label = UILabel()
    var datePicker = UIDatePicker()
    var button = UIButton()
    
    var alarmDate = 0.0
    var count = 0
    var timer: Timer?
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: label settings
        
        view.addSubview(label)
        
        label.frame = CGRect(x: 0, y: 200, width: 200, height: 100)
        label.center.x = view.center.x
        label.textAlignment = .center
        
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Set alarm"
        
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 15


        //MARK: datePicker settings
        
        view.addSubview(datePicker)
        
        datePicker.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        datePicker.center = view.center
        datePicker.preferredDatePickerStyle = .compact
        
        datePicker.addTarget(self, action: #selector(datePickerAction(sender:)), for: .valueChanged)
    

        //MARK: button settings
        
        view.addSubview(button)
        
        button.frame = CGRect(x: 0, y: view.frame.height - 300, width: 110, height: 48)
        button.center.x = view.center.x
        
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.red, for: .highlighted)
        
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
    }
    
    //MARK: Sound
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "Radar", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("error")
        }
        player.play()
    }
    
    func stopSound() {
        player.stop()
    }


    //MARK: Timer
    
    func createTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            if self.count == 0 {
                self.stopTimer()
                self.playSound()
            } else {
                self.count -= 1
                self.label.text = "\(self.count)"
            }
        })
    }
    
    func stopTimer() {
        timer?.invalidate()
    }


    //MARK: Actions
    
    @objc func datePickerAction(sender: UIDatePicker) {
        alarmDate = sender.date.timeIntervalSince1970
    }
    
    @objc func buttonAction(sender: UIButton) {
        if sender.title(for: .normal) == "Start" {
            sender.setTitle("Stop", for: .normal)
            count = Int(self.alarmDate) - Int(Date().timeIntervalSince1970)
            createTimer()
        } else {
            sender.setTitle("Start", for: .normal)
            stopSound()
        }
    }
    
    
}



