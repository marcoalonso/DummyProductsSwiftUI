//
//  Webservice.swift
//  ProductsOnlineSwiftUI
//
//  Created by Marco Alonso Rodriguez on 16/06/23.
//

import UIKit

struct Webservice {
    func getProducts(completion: @escaping ([Product]?) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products") else { return }
        
        let tarea = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                print("Error en el servidor")
                return
            }
            //Decodificar
            do {
                let listProducts = try JSONDecoder().decode(ProductModel.self, from: data)
                completion(listProducts.products)
            } catch {
                completion(nil)
                print("Debug: error al decodificar \(error.localizedDescription)")
            }
        }
        tarea.resume()
    }
    
    func getImageWithCompletion(urlString: String, completionHandler: @escaping(_ image: UIImage?, _ error: Error?) -> ()) {
           guard let url = URL(string: urlString) else { return }
           URLSession.shared.dataTask(with: url) { data, response, error in
               guard let data = data,
                     let image = UIImage(data: data),
                     let _ = response else { return }
               completionHandler(image, nil)
           }
           .resume()
       }
}
