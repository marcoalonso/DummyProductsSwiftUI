//
//  ProductDetailView.swift
//  ProductsOnlineSwiftUI
//
//  Created by Marco Alonso Rodriguez on 18/06/23.
//

import SwiftUI

struct ImageProductDetailView: View {
    
    let product: Product
    
    var gridItemLayout = [GridItem(.flexible())]
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text(product.title)
                .font(.title)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.purple)
                .cornerRadius(12)
                .shadow(radius: 12)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridItemLayout, spacing: 50) {
                    ForEach(product.images, id: \.self) { item in

                        VStack {
                            AsyncImage(url: URL(string: item)) { image in
                                image
                                    .resizable()
                                    .frame(width: 220, height: 300)
                                    .scaledToFill()
                                    .cornerRadius(12)
                                
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.purple, lineWidth: 2)
                        )
                    }
                }
            }.frame(height: 300)
                .padding(.all, 20)
            
            
            
            Text(product.description)
            
            HStack {
                Text(product.brand)
                Text("-")
                Text(product.category)
            }
            
            
            HStack {
                Text("$\(product.price)")
                
                Text("\(String(format: "%.2f", product.discountPercentage))% discount")
                    .foregroundColor(.red)
            }
            .font(.system(size: 22))
            
            Text("Stock: \(product.stock)")
            
            Spacer()
        }
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ImageProductDetailView(product: ProductMock.product)
    }
}
