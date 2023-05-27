//
//  ViewController.swift
//  UIActivityIndicatorView practic
//
//  Created by mac on 26.05.2023.
//

import UIKit

class ViewController: UIViewController {

    var activityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - activityIndicatorView

        view.addSubview(activityIndicatorView)
        activityIndicatorView.center = view.center
        activityIndicatorView.style = .large

        activityIndicatorView.color = .red
        activityIndicatorView.startAnimating()
        activityIndicatorView.hidesWhenStopped = true

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.activityIndicatorView.stopAnimating()

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.activityIndicatorView.startAnimating()
            }
        }
    }


}


