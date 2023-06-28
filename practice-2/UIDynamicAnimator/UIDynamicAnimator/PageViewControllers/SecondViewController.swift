//
//  SecondViewController.swift
//  UIDynamicAnimator
//
//  Created by mac on 27.06.2023.
//

import UIKit

final class SecondViewController: UIViewController {

    //MARK: - Variables

    private var squareViews = [UIDynamicItem]()
    private var animator = UIDynamicAnimator()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        createViews()
        createGravity()
        createCollision()
    }

    //MARK: - Setup DynamicAnimator

    private func createViews() {
        let numberOfView = 2
        squareViews.reserveCapacity(numberOfView)
        let colors = [UIColor.systemBlue, UIColor.yellow]
        var currentCenterPoint = view.center
        let eachViewSize = CGSize(width: 60, height: 60)

        for counter in 0..<numberOfView {
            let newView = UIView(frame: CGRect(x: 0, y: 0, width: eachViewSize.width, height: eachViewSize.height))

            view.addSubview(newView)
            newView.backgroundColor = colors[counter]
            newView.center = currentCenterPoint
            newView.layer.borderColor = UIColor.black.cgColor
            newView.layer.borderWidth = 2
            newView.layer.cornerRadius = 10
            currentCenterPoint.y += eachViewSize.height + 10

            squareViews.append(newView)
        }
        animator = UIDynamicAnimator(referenceView: view)
    }

    private func createGravity() {
        let gravity = UIGravityBehavior(items: squareViews)
        animator.addBehavior(gravity)
    }

    private func createCollision() {
        let collision = UICollisionBehavior(items: squareViews)
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)

        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying,
                              from: CGPoint(x: 0, y: view.bounds.size.height),
                              to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height))

        collision.collisionDelegate = self
    }
}

extension SecondViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        let identifier = identifier as? String
        let bottomBoundary = "bottomBoundary"

        if identifier == bottomBoundary {
            UIView.animate(withDuration: 1) {
                let view = item as? UIView
                view?.backgroundColor = .red
                view?.alpha = 0
                view?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            } completion: { _ in
                behavior.removeItem(item)
            }
        }
    }
}
