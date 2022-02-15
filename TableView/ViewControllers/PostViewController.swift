//
//  PostViewController.swift
//  TableView
//
//  Created by Veronika on 22.01.2022.
//

import Foundation
import UIKit

class PostViewController : UIViewController {
//    var indexSelect : IndexPath?
    var post : Post?

    private var headerLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .systemBlue
        label.textAlignment = .left
        return label
    }()
    private var mainLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
//        label.textColor = .darkGray
        return label
    }()
    
    weak var delegate : ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpConstraints()
        headerLabel.text = post?.title
        mainLabel.text = post?.body
        
    }
}

extension PostViewController {

    private func setUpConstraints() {
        view.addSubview(headerLabel)
//        NSLayoutConstraint.activate([
//            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//        ])
        headerLabel.leading(20.0)
        headerLabel.trailing(-10.0)
        headerLabel.top(30.0, isIncludeSafeArea: true)
        view.addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
//            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
        mainLabel.leading(20.0)
        mainLabel.trailing(-10.0)
    }
}
