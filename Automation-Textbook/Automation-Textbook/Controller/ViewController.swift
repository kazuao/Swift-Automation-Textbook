//
//  ViewController.swift
//  Calc-iosTestText
//
//  Created by kazunori.aoki on 2022/01/29.
//

import UIKit

class ViewController: UIViewController {

    var manager: GitHubRepositoryManager!

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        manager = GitHubRepositoryManager()
        manager.load(user: "apple") { [weak self] in
            self?.tableView.reloadData()
        }
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.majorRepositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!

        let repository = manager.majorRepositories[indexPath.row]
        cell.textLabel?.text = repository.name
        return cell
    }

}
