//
//  ViewController.swift
//  UITableViewController
//
//  Created by mac on 02.07.2023.
//

import UIKit

final class ViewController: UIViewController {

//    MARK: - Variables

    private let tableViewController = UITableViewController(style: .grouped)
    private var refresh = UIRefreshControl()

    private var allTime = [Date()]
    private let cellIdentifier = "myCell"

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)

        createTableView()
        setupRefresh()
    }

    //MARK: - Custom func

    private func createTableView() {
        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self

        tableViewController.tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableViewController.tableView)

        NSLayoutConstraint.activate([
            tableViewController.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableViewController.tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableViewController.tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewController.tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupRefresh() {
        refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableViewController.tableView.addSubview(refresh)
        refresh.tintColor = .red
    }

    //MARK: - #selector

    @objc func handleRefresh() {
        allTime.append(Date())
        refresh.endRefreshing()
        let indexPathNewRow = IndexPath(row: allTime.count - 1, section: 0)
        tableViewController.tableView.insertRows(at: [indexPathNewRow], with: .automatic)
    }
}

//MARK: - extension

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allTime.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        let date = allTime[indexPath.row]
        cell.textLabel?.text = "\(date)"

        return cell
    }
}
