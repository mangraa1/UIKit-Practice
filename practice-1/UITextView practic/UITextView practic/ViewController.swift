//
//  ViewController.swift
//  UITextView practic
//
//  Created by mac on 22.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descriptionTV: UITextView!
    
    let toTopButton = UIButton()
    var mode = Mode.edit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.green
        shadow.shadowBlurRadius = 15
        
        //MARK: - titleTF
        
        titleTF.borderStyle = .none
        titleTF.layer.borderWidth = 1
        titleTF.layer.cornerRadius = 5
        titleTF.layer.borderColor = UIColor.gray.cgColor
        
        titleTF.font = UIFont.systemFont(ofSize: 20)
        
        //MARK: - descriptionTV
        
        descriptionTV.delegate = self
        
        descriptionTV.layer.borderWidth = 1
        descriptionTV.layer.cornerRadius = 10
        descriptionTV.layer.borderColor = UIColor.gray.cgColor
        
        descriptionTV.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        descriptionTV.allowsEditingTextAttributes = true
        descriptionTV.keyboardDismissMode = .onDrag
        
        descriptionTV.dataDetectorTypes = [.link, .phoneNumber]
        
        descriptionTV.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemBlue,
            NSAttributedString.Key.shadow: shadow]
        
        descriptionTV.text = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent iaculis urna tellus, ac iaculis sapien consequat eu. Nunc vel arcu a purus rutrum interdum. Morbi sed porta lectus. Aenean suscipit nisi eu tortor sodales, at mattis nulla volutpat. Nunc luctus, turpis non tincidunt volutpat, est lectus fermentum diam, tristique ultrices erat leo sed sem. Morbi nec euismod purus. Nullam non eros quis odio venenatis efficitur. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque commodo arcu ac rhoncus commodo. Fusce lorem elit, dapibus quis risus id, dignissim interdum odio. Aliquam tincidunt quam ut eros pharetra varius. Donec est ligula, luctus eu tellus vel, maximus scelerisque felis. Link: https://ru.lipsum.com/feed/html
        """
        
        //MARK: - toTopButton
        
        view.addSubview(toTopButton)
        toTopButton.setTitle("To top", for: .normal)
        toTopButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        toTopButton.setTitleColor(.systemBlue, for: .normal)
        
        toTopButton.addTarget(self, action: #selector(toTopAction), for: .touchUpInside)
        
        //MARK: - Constraints
        
        toTopButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            toTopButton.topAnchor.constraint(equalTo: descriptionTV.bottomAnchor, constant: 24),
            toTopButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            toTopButton.widthAnchor.constraint(equalToConstant: 100),
            toTopButton.heightAnchor.constraint(equalToConstant: 40)])
        
        
        
    }
    
    //MARK:  Actions
    
    @objc func toTopAction() {
        descriptionTV.scrollRangeToVisible(NSRange(location: 0, length: 0))
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        mode.togle()
        let buttonTitle = (mode == .preview) ? "Edit" : "Preview"
        let toValue: CGFloat = (mode == .preview) ? 0 : 1
        
        UIView.animate(withDuration: 1) {
            sender.setTitle(buttonTitle, for: .normal)
        }
        
        titleTF.animateBorderWidth(toValue: toValue, duration: 0.5)
        descriptionTV.animateBorderWidth(toValue: toValue, duration: 0.5)
        descriptionTV.isEditable = mode == .edit
    }
    
}
    
//MARK: Extensions

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch mode {
        case .edit:
            return true
        default:
            return false
        }
    }
}

extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        switch mode {
        case .edit:
            return true
        default:
            return false
        }
    }
}

extension UIView {
    func animateBorderWidth(toValue: CGFloat, duration: Double) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "borderWidth")
        animation.fromValue = layer.borderWidth
        animation.toValue = toValue
        animation.duration = duration
        layer.add(animation, forKey: "Width")
        layer.borderWidth = toValue
    }
}

//MARK: Enum

enum Mode {
    case preview
    case edit
    
    mutating func togle() {
        switch self {
        case .preview: self = .edit
        case .edit: self = .preview
        }
    }
}

