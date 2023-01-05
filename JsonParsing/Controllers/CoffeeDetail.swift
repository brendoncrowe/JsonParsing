//
//  ViewController.swift
//  JsonParsing
//
//  Created by Brendon Crowe on 1/5/23.
//

import UIKit

class CoffeeDetail: UIViewController {
    
    @IBOutlet weak var coffeeImage: UIImageView!
    @IBOutlet weak var coffeeDescription: UITextView!
    @IBOutlet weak var coffeeIngredients: UILabel!
    
    var coffee: Coffee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        
    }
    
    func updateUI() {

        navigationItem.title = coffee?.title
        coffeeDescription.text = coffee?.description
        let ingredients = coffee?.ingredients.joined(separator: ", ")
        let coffeeDetailIngredients = "Ingredients: " + (ingredients ?? "none")
        coffeeIngredients.text = coffeeDetailIngredients
            if let image = coffee?.image {
                ImageClient.fetchImage(for: image) { [unowned self] (result) in
                    switch result {
                    case .success(let image):
                        DispatchQueue.main.async {
                            self.coffeeImage.image = image
                        }
                    case .failure(let error):
                        print("error: - \(error)")
                    }
                }
            }
        }
    }

