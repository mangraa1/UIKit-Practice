//
//  ViewController.swift
//  UIDynamicAnimator
//
//  Created by mac on 27.06.2023.
//

import UIKit

final class ViewController: UIViewController {

    //MARK: - Variables

    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)

    private let firstViewController = FirstViewController()
    private let secondViewController = SecondViewController()
    private let thirdViewController = ThirdViewController()

    private var viewControllers = [UIViewController]()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray

        setupPageViewController()
    }

    private func setupPageViewController() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)

        viewControllers = [firstViewController, secondViewController, thirdViewController]

        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true, completion: nil)

        pageViewController.dataSource = self
        pageViewController.delegate = self
    }
}

//MARK: - Extensions

extension ViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllers.firstIndex(of: viewController), currentIndex > 0 else { return nil }

        return viewControllers[currentIndex - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllers.firstIndex(of: viewController), currentIndex < viewControllers.count - 1 else { return nil }

        return viewControllers[currentIndex + 1]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

