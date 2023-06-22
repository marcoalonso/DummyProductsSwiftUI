//
//  Producto.swift
//  ProductosOnline
//
//  Created by Marco Alonso Rodriguez on 08/03/23.
//

import Foundation

struct ProductModel: Codable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}

struct ProductMock {
    static let product = Product(id: 123,
                                 title: "iPhone 14",
                                 description: "New iPhone 14 Description",
                                 price: 29999,
                                 discountPercentage: 10.99,
                                 rating: 12,
                                 stock: 12,
                                 brand: "Apple",
                                 category: "Smartphone",
                                 thumbnail: "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
                                 images: [
                                    "https://i.dummyjson.com/data/products/1/1.jpg",
                                    "https://i.dummyjson.com/data/products/1/2.jpg",
                                    "https://i.dummyjson.com/data/products/1/3.jpg",
                                    "https://i.dummyjson.com/data/products/1/4.jpg",
                                    "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
                                 ])
}
