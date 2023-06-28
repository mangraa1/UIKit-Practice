//
//  FirstViewController.swift
//  UIDynamicAnimator
//
//  Created by mac on 27.06.2023.
//

import UIKit

final class FirstViewController: UIViewController {

    //MARK: - Variables

    private let squareView = UIView()
    private var animator = UIDynamicAnimator()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        createSquareView()
        createAnimatorAndGravity()
    }

    //MARK: - Setup DynamicAnimator

    private func createSquareView() {
        view.addSubview(squareView)
        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        squareView.center = view.center
        squareView.backgroundColor = .systemCyan
        squareView.layer.borderColor = UIColor.black.cgColor
        squareView.layer.borderWidth = 2
        squareView.layer.cornerRadius = 20
    }

    private func createAnimatorAndGravity() {
        animator = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: [squareView])
        animator.addBehavior(gravity)
    }

}
