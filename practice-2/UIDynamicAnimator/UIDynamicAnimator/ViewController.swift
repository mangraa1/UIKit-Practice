//
//  ViewController.swift
//  UIDynamicAnimator
//
//  Created by mac on 27.06.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Variables

    let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)

    let firstViewController = FirstViewController()
    let secondViewController = SecondViewController()

    let viewControllers = [UIViewController]()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)

        let viewControllers = [firstViewController, secondViewController]

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
}

