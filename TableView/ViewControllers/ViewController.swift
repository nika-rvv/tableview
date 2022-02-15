//
//  ViewController.swift
//  TableView
//
//  Created by Veronika on 17.01.2022.
//

// https://jsonplaceholder.typicode.com
// Шо надо: Получить данные, поместить в модель, отдать в контроллер в таблицу, сделать экран уточнения новости (просто открыть и передать данные в другой контроллер к примеру в лейбл) Ячейки кастомные (наследники UITableViewCell) мождн xib или код.

import UIKit

class ViewController: UIViewController {
    private let mainTable : UITableView = UITableView()
    private var posts = [Post]()
    private var indexSelect : IndexPath?
    private let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.getData(url: url!) {[weak self] result in
            switch result {
                
            case .success(let posts):
                DispatchQueue.main.async {
                    self?.posts = posts
                    self?.mainTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        view.backgroundColor = .white
        title = "Новости"
        setupConstraints()
        setupUI()
    
    }
}

extension ViewController {
    private func setupConstraints(){
        mainTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainTable)
        mainTable.pins()
    }
    private func setupUI(){
        mainTable.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        mainTable.dataSource = self
        mainTable.delegate = self
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(post: posts[indexPath.row])
        return cell
    }
}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView : UITableView, didSelectRowAt indexPath: IndexPath){
        let postVC = PostViewController()
        postVC.post = posts[indexPath.row]
        navigationController?.pushViewController(postVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//TODO: убрать форс-анрапы, сверстать второй экран, передать посты на второй экран, прочитать про ARC
