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
        myTableView = UITableView(frame: view.bounds, style: .grouped)
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

        cell.textLabel?.text = "section = \(indexPath.section)  row = \(indexPath.row)"
        cell.accessoryType = .detailButton

        switch indexPath.section {
        case 0: cell.backgroundColor = .yellow
        case 1: cell.backgroundColor = .systemPink
        case 2: cell.backgroundColor = .systemCyan
        default: break
        }

        return cell
    }

    //MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.00
    }

    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Alert", message: "section = \(indexPath.section)  row = \(indexPath.row)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
}

