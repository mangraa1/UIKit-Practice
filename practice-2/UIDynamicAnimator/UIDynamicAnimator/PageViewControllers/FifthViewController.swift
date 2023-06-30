//
//  FifthViewController.swift
//  UIDynamicAnimator
//
//  Created by mac on 30.06.2023.
//

import UIKit

final class FifthViewController: UIViewController {

    //MARK: - Variables

    private var squareView = UIView()
    private var animator = UIDynamicAnimator()
    private var snapBehavior: UISnapBehavior? = nil

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 233/247, green: 233/247, blue: 233/247, alpha: 1)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        createSquareView()
        createGestureRecognizer()
        createAnimatorAndBehaviors()
    }

    //MARK: - Setup DynamicAnimator

    private func createSquareView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.center = view.center
        squareView.backgroundColor = .systemOrange
        squareView.layer.borderWidth = 2
        squareView.layer.borderColor = UIColor.black.cgColor
        squareView.layer.cornerRadius = 15

        view.addSubview(squareView)
    }

    private func createGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(paramTap:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    private func createAnimatorAndBehaviors() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)

        snapBehavior = UISnapBehavior(item: squareView, snapTo: squareView.center)
        snapBehavior?.damping = 0.5
        animator.addBehavior(snapBehavior!)
    }

    //MARK: - #selector

    @objc func handleTap(paramTap: UITapGestureRecognizer) {
        let tapPoint = paramTap.location(in: view)
        if snapBehavior != nil {
            animator.removeBehavior(snapBehavior!)
        }
        snapBehavior = UISnapBehavior(item: squareView, snapTo: tapPoint)
        snapBehavior?.damping = 0.5
        animator.addBehavior(snapBehavior!)
    }
}
