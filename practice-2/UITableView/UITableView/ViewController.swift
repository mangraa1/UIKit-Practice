//
//  ViewController.swift
//  UITableView
//
//  Created by mac on 01.07.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Variables

    private var myTableView = UITableView()
    private let identifire = "MyCell"

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMyTableView()
    }

    //MARK: - Custom func

    private func setupMyTableView() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        myTableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        myTableView.dataSource = self
        myTableView.delegate = self

        view.addSubview(myTableView)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    //MARK: UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return 5
        case 2: return 8
        default: break
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)

        cell.textLabel?.text = "secrion = \(indexPath.section)  row = \(indexPath.row)"

        return cell
    }

    //MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.00
    }
}

