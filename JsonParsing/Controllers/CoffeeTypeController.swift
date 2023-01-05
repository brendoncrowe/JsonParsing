//
//  ViewController.swift
//  JsonParsing
//
//  Created by Brendon Crowe on 1/4/23.
//

import UIKit

class CoffeeTypeController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var coffeeDrinks = [Coffee]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadData()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
    }
    
    private func loadData() {
        coffeeDrinks = Coffee.getCoffees()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? CoffeeDetail, let indexPath = tableView.indexPathForSelectedRow else { fatalError("could not load detail view controller") }
        detailVC.coffee = coffeeDrinks[indexPath.row]
    }
}



extension CoffeeTypeController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeDrinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeCell", for: indexPath) as? CoffeeCustomCell else { fatalError("could not dequeue a coffee cell")}
        let coffee = coffeeDrinks[indexPath.row]
        cell.configureCell(for: coffee)
        return cell
    }
}
