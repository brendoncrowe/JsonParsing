//
//  CustomCell.swift
//  JsonParsing
//
//  Created by Brendon Crowe on 1/5/23.
//

import UIKit

class CoffeeCustomCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLabel: UILabel!


    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        cellImageView.layer.cornerRadius = cellImageView.frame.size.width / 2
    }
    
    func configureCell(for coffee: Coffee) {
        cellTitleLabel.text = coffee.title

        let coffeeImage = coffee.image
        ImageClient.fetchImage(for: coffeeImage) { [unowned self] (result) in
                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        self.cellImageView.image = image
                    }
                case.failure(let error):
                    print("cell image error - \(error)")
                }
            }
        }
        
    }

