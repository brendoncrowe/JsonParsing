//
//  UserController.swift
//  JsonParsing
//
//  Created by Brendon Crowe on 1/4/23.
//

import UIKit

class UserController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadData()
        dump(users)

    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadData() {
        users = UserData.getUsers()
    }
}

extension UserController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let cellData = users[indexPath.row]
        var cellContent = cell.defaultContentConfiguration()
        cellContent.text = cellData.name.first + " " + cellData.name.last
        cell.contentConfiguration = cellContent
        return cell
    }
    
}
