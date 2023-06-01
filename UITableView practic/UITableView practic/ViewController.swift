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
    var contacts = Source.makeContacts()

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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactCell else { fatalError() }

        

        return cell
    }



}

extension ViewController: UITableViewDelegate {

}

extension ViewController {
    func setupTableView() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

