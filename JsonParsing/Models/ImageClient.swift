//
//  ImageClient.swift
//  JsonParsing
//
//  Created by Brendon Crowe on 1/5/23.
//

import UIKit

struct ImageClient {
    
    
    static func fetchImage(for urlString: String, completionHandler: @escaping (Result<UIImage?, Error>) -> ()) {
        
        guard let url = URL(string: urlString) else { print("bad url string")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("error: \(error)")
            }
            if let data = data {
                let image = UIImage(data: data)
                completionHandler(.success(image))
            }
        }
        dataTask.resume()
        
    }
    
}
