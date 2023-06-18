//
//  ProductViewModel.swift
//  ProductsOnlineSwiftUI
//
//  Created by Marco Alonso Rodriguez on 18/06/23.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var listProducts: [Product] = []
    
    let webservice: Webservice
    
    init(webservice: Webservice) {
        self.webservice = webservice
        getProducts()
    }
    
    func getProducts(){
        webservice.getProducts { listProducts in
            if let listProducts = listProducts {
                DispatchQueue.main.async {
                    self.listProducts = listProducts
                }
            }
        }
    }
}
