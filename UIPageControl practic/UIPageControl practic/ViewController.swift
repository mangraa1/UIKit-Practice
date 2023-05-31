//
//  ViewController.swift
//  UIPageControl practic
//
//  Created by mac on 31.05.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
    let pageControl = UIPageControl()

    let strings = ["first", "second", "third"]

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configurateScrollView()

        view.addSubview(pageControl)

        pageControl.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        pageControl.numberOfPages = strings.count
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .red

        scrollView.delegate = self
    }
}

//MARK: - extensions

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}

extension ViewController {
    func configurateScrollView() {

        view.addSubview(scrollView)

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.height.equalTo(300)
        }

        scrollView.backgroundColor = UIColor(red: 159/255, green: 237/255, blue: 255/255, alpha: 1)
        scrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width) * strings.count, height: 300)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false

        scrollView.layer.borderWidth = 1
        scrollView.layer.borderColor = UIColor.black.cgColor
        scrollView.layer.cornerRadius = 10

        addLabelForPage(title: strings[0], position: 0)
        addLabelForPage(title: strings[1], position: 1)
        addLabelForPage(title: strings[2], position: 2)
    }

    func addLabelForPage(title: String, position: CGFloat) {
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 23)

        scrollView.addSubview(label)
        let screenWidth = UIScreen.main.bounds.width
        label.frame = CGRect(x: screenWidth * position, y: 0, width: screenWidth, height: 300)
    }
}

