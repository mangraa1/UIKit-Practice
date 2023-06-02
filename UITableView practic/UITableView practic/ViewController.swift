//
//  ViewController.swift
//  UITableView practic
//
//  Created by mac on 01.06.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let tableView: UITableView = .init()
    var contacts = Source.makeContactsWithGroup()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()

        tableView.register(ContactCell.self, forCellReuseIdentifier: "ContactCell")

        tableView.dataSource = self
        tableView.delegate = self
    }

}

//MARK: - Extensions

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section  {
        case 0: return "Group 1"
        case 1: return "Group 2"
        default: return nil
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactCell else { fatalError() }

//        cell.configure(contact: contacts[indexPath.row])
        cell.configure(contact: contacts[indexPath.section][indexPath.row])
 
        return cell
    }



}

extension ViewController: UITableViewDelegate {

}

extension ViewController {

    func setupTableView() {

        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

