//
//  ViewController.swift
//  TableViewExample
//
//  Created by Nikita Kazakov on 24.07.2021.
//

import UIKit

enum CellType {
    case plain
    case descr
    case `switch`
}

struct ItemModel {
    let type: CellType
    let image: UIImage? = nil
    let title: String
    var isOn: Bool? = nil
    var descr: String? = nil
}

class ViewController: UIViewController {

    var data = [
        "Section0": [ItemModel(type: .switch, title: "Airplane mode"), ItemModel(type: .descr, title: "Wi-Fi")],
        "Section1": [ItemModel(type: .plain, title: "Notifications"), ItemModel(type: .plain, title: "Sounds & Haptics")]
    ]

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        data.keys.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data["Section\(section)"]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data["Section\(indexPath.section)"]?[indexPath.row] else { return UITableViewCell() }

        switch data.type {
        case .descr:
            return setupDescriptionCell(for: indexPath, with: data)
        case .switch:
            return setupSwitchCell(for: indexPath, with: data)
        case .plain:
            return setupPlainCell(for: indexPath, with: data)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячейка \(data["Section\(indexPath.section)"]?[indexPath.row].title)")
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Settings cells

    private func setupDescriptionCell(for indexPath: IndexPath, with data: ItemModel) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TableViewCell.identifier,
                for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = data.title
        return cell
    }

    private func setupSwitchCell(for indexPath: IndexPath, with data: ItemModel) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TableViewCell.identifier,
                for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = data.title
        return cell
    }

    private func setupPlainCell(for indexPath: IndexPath, with data: ItemModel) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TableViewCell.identifier,
                for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = data.title
        return cell
    }
}
