//
//  CoffeeModel.swift
//  JsonParsing
//
//  Created by Brendon Crowe on 1/5/23.
//

import Foundation


struct Coffee: Codable {
    let title: String
    let description: String
    let ingredients: [String]
    let image: String
}


extension Coffee {
    
    static func getCoffees() -> [Coffee] {
        
        var coffeeDrinks = [Coffee]()
        // first get path to data
        guard let pathToData = Bundle.main.url(forResource: "coffee", withExtension: "json") else { fatalError("path to data is invalid") }
        
        // second, decode data
        
        do {
            let data = try Data(contentsOf: pathToData)
            let coffeeData = try JSONDecoder().decode([Coffee].self, from: data)
            coffeeDrinks = coffeeData
        } catch {
            fatalError("could not load data \(error)")
        }
        return coffeeDrinks
    }
}

