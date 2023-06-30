//
//  FourthViewController.swift
//  UIDynamicAnimator
//
//  Created by mac on 29.06.2023.
//

import UIKit

final class FourthViewController: UIViewController {

    //MARK: - Variables

    private let squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    private let squareViewAnchorView = UIView(frame: CGRect(x: 50, y: 0, width: 30, height: 30))
    private let anchorView = UIView(frame: CGRect(x: 290, y: 260, width: 30, height: 30))
    private var animator = UIDynamicAnimator()
    private var attachmentBehavior: UIAttachmentBehavior? = nil

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 211/247, green: 211/247, blue: 211/247, alpha: 1)
    }

    override func viewDidAppear(_ animated: Bool) {
        createGestureRecognizer()
        createSquareView()
        createAnchorView()
        createAnimationAndBehavior()
    }

    //MARK: - Setup DynamicAnimator

    private func createSquareView() {    //create square with a circle inside
        view.addSubview(squareView)
        squareView.center = view.center
        createHelper(view: squareView, backgroundColor: .systemPink, cornerRadius: 15)

        squareView.addSubview(squareViewAnchorView)
        createHelper(view: squareViewAnchorView, backgroundColor: .systemIndigo, cornerRadius: 16)
    }

    private func createAnchorView() {    //create view with anchor point
        view.addSubview(anchorView)
        createHelper(view: anchorView, backgroundColor: .systemIndigo, cornerRadius: 16)
    }

    private func createGestureRecognizer() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(paramPan:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }

    private func createAnimationAndBehavior() {    //create collision and attachment
        animator = UIDynamicAnimator(referenceView: view)

        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)

        attachmentBehavior = UIAttachmentBehavior(item: squareView, attachedToAnchor: anchorView.center)
        animator.addBehavior(attachmentBehavior!)
    }

    //MARK: - #selector

    @objc func handlePan(paramPan: UIPanGestureRecognizer) {    //defines a touch, and binds this place to the squareView
        let tapPoint = paramPan.location(in: view)
        attachmentBehavior?.anchorPoint = tapPoint
        anchorView.center = tapPoint
    }

    //MARK: - Custom functions

    private func createHelper(view: UIView, backgroundColor: UIColor, cornerRadius: CGFloat) {
        view.backgroundColor = backgroundColor
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = cornerRadius
    }
}
