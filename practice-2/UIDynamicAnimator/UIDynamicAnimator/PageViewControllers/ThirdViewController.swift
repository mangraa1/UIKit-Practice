//
//  ThirdViewController.swift
//  UIDynamicAnimator
//
//  Created by mac on 28.06.2023.
//

import UIKit

final class ThirdViewController: UIViewController {

    //MARK: - Variables

    private let squareView = UIView()
    private var animator = UIDynamicAnimator()
    private var pushBehavior = UIPushBehavior()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 233/247, green: 233/247, blue: 233/247, alpha: 1)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        createSquareView()
        createGestureRecognizer()
        createAnimationAndBehaviors()
    }

    //MARK: - Setup DynamicAnimator

    private func createSquareView() {
        view.addSubview(squareView)
        squareView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        squareView.center = view.center
        squareView.backgroundColor = .systemGreen
        squareView.layer.borderColor = UIColor.black.cgColor
        squareView.layer.borderWidth = 2
        squareView.layer.cornerRadius = 15
    }

    private func createGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    private func createAnimationAndBehaviors() {
        animator = UIDynamicAnimator(referenceView: view)

        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)

        pushBehavior = UIPushBehavior(items: [squareView], mode: .continuous)
        animator.addBehavior(pushBehavior)
    }

    //MARK: - #selector

    @objc func tapHandler(paramTap: UITapGestureRecognizer) {
        let tapPoint: CGPoint = paramTap.location(in: view)
        let squareViewCenterPoint: CGPoint = squareView.center
        let deltaX: CGFloat = tapPoint.x - squareViewCenterPoint.x
        let deltaY: CGFloat = tapPoint.y - squareViewCenterPoint.y
        let angle: CGFloat = atan2(deltaY, deltaX)
        pushBehavior.angle = angle

        let distanceBetween: CGFloat = sqrt(pow(tapPoint.x - squareViewCenterPoint.x, 2.0) + pow(tapPoint.y - squareViewCenterPoint.y, 2.0))
        pushBehavior.magnitude = distanceBetween / 200
    }
}
