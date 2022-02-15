//
//  TableViewCell.swift
//  TableView
//
//  Created by Veronika on 18.01.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    private let titleLabel : UILabel = UILabel()
    private let bodyLabel : UILabel = UILabel()
    private let labelStackView : UIStackView = UIStackView()
    
    func configure(post : Post) {
        setupLayout()
        labelStackView.axis = .vertical
        labelStackView.spacing = 10
        labelStackView.distribution = .fill
        labelStackView.alignment = .leading
        
        titleLabel.text = post.title
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        titleLabel.numberOfLines = 0
        bodyLabel.text = post.body
        bodyLabel.textColor = .systemGray
        bodyLabel.font = UIFont.systemFont(ofSize: 16, weight: .thin)
        bodyLabel.numberOfLines = 0
        
    }
    private func setupLayout() {
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(labelStackView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(bodyLabel)
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: labelStackView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: labelStackView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: labelStackView.trailingAnchor, constant: -10),
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            bodyLabel.leadingAnchor.constraint(equalTo: labelStackView.leadingAnchor, constant: 10),
            bodyLabel.trailingAnchor.constraint(equalTo: labelStackView.trailingAnchor, constant: -10)
        ])
    }
}
