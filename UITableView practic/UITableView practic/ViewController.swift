//
//  ViewController.swift
//  UITableView practic
//
//  Created by mac on 01.06.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var contacts = Source.makeContactsWithGroup()

    let tableView: UITableView = .init()
    let editButton = UIButton()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupButton()

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

        cell.configure(contact: contacts[indexPath.section][indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        contacts[indexPath.section].remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)

    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let contact = contacts[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        contacts[destinationIndexPath.section].insert(contact, at: destinationIndexPath.row)
    }

}

extension ViewController: UITableViewDelegate {

}

extension ViewController {
    func setupTableView() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
        }
    }
}

extension ViewController {
    func setupButton() {
        view.addSubview(editButton)

        editButton.setTitleColor(.black, for: .normal)
        editButton.setTitleColor(.lightGray, for: .highlighted)
        editButton.setTitle("edit", for: .normal)
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)

        editButton.layer.borderWidth = 1
        editButton.layer.borderColor = UIColor.black.cgColor
        editButton.layer.cornerRadius = 15

        editButton.addTarget(self, action: #selector(edit(sender:)), for: .touchUpInside)

        editButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(8)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.left.equalToSuperview().offset(16)
        }
    }

    @objc func edit(sender: UIButton) {
        tableView.isEditing.toggle()
        editButton.setTitle(tableView.isEditing ? "end edit" : "edit", for: .normal)
    }
}

