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

    let tableView: UITableView = .init(frame: .zero, style: .insetGrouped )
    let editButton = UIButton()
    let reloadButton = UIButton()

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupEditButton()
        setupReloadButton()

        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)

        tableView.register(ContactCell.self, forCellReuseIdentifier: "ContactCell")

        tableView.dataSource = self
        tableView.delegate = self

        tableView.separatorColor = .systemBlue
        tableView.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }

    //MARK: - Custom functions

    func setupNewButton(_ button: UIButton, withText text: String) {
        view.addSubview(button)

        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)

        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 15
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ac = UIAlertController(
            title: contacts[indexPath.section][indexPath.row].name,
            message: contacts[indexPath.section][indexPath.row].description,
            preferredStyle: .alert)

        ac.addAction(.init(title: "ok", style: .default))
        present(ac, animated: true)
    }

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
    func setupEditButton() {

        setupNewButton(editButton, withText: "edit")

        editButton.addTarget(self, action: #selector(edit(sender:)), for: .touchUpInside)

        editButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(10)
            make.right.equalTo(view.snp.centerX).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.left.equalToSuperview().offset(16)
        }
    }

    @objc func edit(sender: UIButton) {
        tableView.isEditing.toggle()
        editButton.setTitle(tableView.isEditing ? "end edit" : "edit", for: .normal)
    }
}

extension ViewController {
    func setupReloadButton() {

        setupNewButton(reloadButton, withText: "reload")

        reloadButton.addTarget(self, action: #selector(reload(sender:)), for: .touchUpInside)

        reloadButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.left.equalTo(view.snp.centerX).offset(16)
        }
    }

    @objc func reload(sender: UIButton) {
        contacts = Source.makeContactsWithGroup()
        tableView.reloadData()
    }
}

