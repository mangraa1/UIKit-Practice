//
//  ViewController.swift
//  UIProgressView
//
//  Created by mac on 25.06.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Variables

    private let myProgressView = UIProgressView()
    private let myButton = UIButton()
    private var myTimer = Timer()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        createProgressView(myProgressView)
        createButton(myButton)
        createTimer()

    }

    //MARK: - UI elements

    private func createProgressView(_ progressView: UIProgressView) {
        view.addSubview(progressView)

        progressView.progressViewStyle = .default
        progressView.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        progressView.center = view.center
        progressView.setProgress(0, animated: false)

        progressView.trackTintColor = .lightGray
        progressView.progressTintColor = .systemBlue
    }

    private func createButton(_ button: UIButton) {
        view.addSubview(button)

        button.frame = CGRect(x: 0, y: view.center.y + 40, width: 150, height: 50)
        button.center.x = view.center.x
        button.setTitle("loading...", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.alpha = 0.3

        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
    }

    //MARK: - Timer

    private func createTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
    }

    //MARK: - Selector

    @objc func updateProgressView() {
        if myProgressView.progress != 1.0 {
            myProgressView.progress += 0.1
        } else {
            UIView.animate(withDuration: 0.3) {
                self.myButton.alpha = 1
                self.myButton.setTitle("start", for: .normal)
                self.myTimer.invalidate()
            }
        }
    }
}

