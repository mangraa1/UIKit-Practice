//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by mac on 17.06.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Variables

    let buttonShare = UIButton()
    let textField = UITextField()
    var activityViewController: UIActivityViewController?

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        createTextField()
        createButton()
    }

    //MARK: - Method

    func createTextField() {
        view.addSubview(textField)
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        textField.center = view.center
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter text"

        textField.delegate = self
    }

    func createButton() {
        view.addSubview(buttonShare)
        buttonShare.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        buttonShare.setTitle("Share", for: .normal)
        buttonShare.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        buttonShare.setTitleColor(.systemBlue, for: .normal)

        buttonShare.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
        }

        buttonShare.addTarget(self, action: #selector(hendleShare), for: .touchUpInside)
    }

    @objc func hendleShare() {
        let text = textField.text

        if text?.count == 0 {
            let message = "first enter the text and then press the button"

            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel)

            alert.addAction(okAction)
            present(alert, animated: true)
        }

        activityViewController = UIActivityViewController(activityItems: [textField.text ?? "nil"], applicationActivities: nil)
        present(activityViewController!, animated: true)
    }

    //MARK: - UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }

}

