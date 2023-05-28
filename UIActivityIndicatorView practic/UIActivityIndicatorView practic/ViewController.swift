//
//  ViewController.swift
//  UIActivityIndicatorView practic
//
//  Created by mac on 26.05.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let topLabel = UILabel()
    let imageView = UIImageView()
    let progressView = UIProgressView(progressViewStyle: .default)
    let progress = Progress(totalUnitCount: 11)
    let button = UIButton()
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - topLabel

        view.addSubview(topLabel)

        topLabel.text = "What do you want to know?"
        topLabel.textAlignment = .center
        topLabel.font = UIFont.systemFont(ofSize: 23)
        topLabel.textColor = .blue
        topLabel.numberOfLines = 0

        //MARK: - imageView

        view.addSubview(imageView)

        imageView.image = UIImage(named: "ask")

        //MARK: - progressView

        view.addSubview(progressView)

        progressView.trackTintColor = .red
        progressView.progressTintColor = .systemPink
        progressView.observedProgress = progress

        progress.cancellationHandler = {
            DispatchQueue.main.async {
                self.updateWithAnimation {
                    self.topLabel.alpha = 0
                    self.imageView.alpha = 0
                } completion: {
                    self.topLabel.alpha = 1
                    self.imageView.alpha = 1
                    self.topLabel.text = Source.getTask()
                    self.imageView.image = UIImage(named: "ask")
                }
            }
        }

        //MARK: - button

        view.addSubview(button)

        button.setTitle("what am i doing today?", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)

        button.layer.borderWidth = 1
        button.layer.cornerRadius = 13
        button.layer.borderColor = UIColor.black.cgColor

        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)

        //MARK: - Constraints

        topLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.left.right.equalToSuperview().inset(16)
        }

        imageView.snp.makeConstraints { make in
            make.top.equalTo(topLabel).inset(50)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(300)
        }

        progressView.snp.makeConstraints { make in
            make.top.equalTo(imageView).inset(315)
            make.left.right.equalToSuperview().inset(16)
        }

        button.snp.makeConstraints { make in
            make.top.equalTo(progressView).inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(220)
        }

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    func updateWithAnimation(task: @escaping () -> Void, completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.25, animations: task) { _ in
            UIView.animate(withDuration: 0.25, animations: completion)
        }
    }

    //MARK: - Actions

    @objc func buttonAction(sender: UIButton) {
        DispatchQueue.main.async {
            self.updateWithAnimation {
                self.topLabel.alpha = 0
                self.imageView.alpha = 0
            } completion: {
                self.topLabel.alpha = 1
                self.imageView.alpha = 1
                self.topLabel.text = "I think..."
                self.imageView.image = UIImage(named: "think")
            }
        }

        var count: Int64 = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { timer in
            if self.progress.fractionCompleted == 1 {
                self.progress.cancel()
                timer.invalidate()
            }

            self.progress.completedUnitCount = count
            count += 1
        })
    }

}


