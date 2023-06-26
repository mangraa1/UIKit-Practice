//
//  myPageViewController.swift
//  UIPageViewController
//
//  Created by mac on 26.06.2023.
//

import UIKit

final class myPageViewController: UIPageViewController {

    //MARK: - Variables

    private var cars = [CarsHelper]()
    private let continental = UIImage(named: "continental")
    private let phantom = UIImage(named: "phantom")

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Cars"

        let firstCar = CarsHelper(name: "Bentley Continental", image: continental!)
        let secondCar = CarsHelper(name: "Rolls-Royce Phantom", image: phantom!)
        cars += [firstCar, secondCar]
    }

    //MARK: - create VC

    lazy var arrayCarViewcontroller: [CarViewController] = {
        var carsVC = [CarViewController]()
        for car in cars {
            carsVC.append(CarViewController(carWith: car))
        }
        return carsVC
    }()

    //MARK: - init UIPageViewController

    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation)

        self.view.backgroundColor = .systemBlue

        setViewControllers([arrayCarViewcontroller[0]], direction: .forward, animated: true)

        self.dataSource = self
        self.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension myPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }

        if let index = arrayCarViewcontroller.firstIndex(of: viewController) {
            if index > 0 {
                return arrayCarViewcontroller[index - 1]
            }
        }

        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }

        if let index = arrayCarViewcontroller.firstIndex(of: viewController) {
            if index < cars.count - 1 {
                return arrayCarViewcontroller[index + 1]
            }
        }

        return nil
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return cars.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
