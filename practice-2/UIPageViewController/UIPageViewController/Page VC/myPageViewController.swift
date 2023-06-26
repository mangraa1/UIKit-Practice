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
        let secondCar = CarsHelper(name: "Rolls-Royce Phantom", image: continental!)
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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
