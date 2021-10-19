//
//  TableViewCell.swift
//  TableViewExample
//
//  Created by Nikita Kazakov on 24.07.2021.
//

import UIKit

final class TableViewCell: UITableViewCell {

    static let identifier = "TableViewCell"

    func configure(with title: String) {
        titleLabel.text = title
    }

    // MARK: - Views

    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 17)
        return title
    }()

    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(titleLabel)
    }

    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
