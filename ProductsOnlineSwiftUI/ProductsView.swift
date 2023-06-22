//
//  ContentView.swift
//  ProductsOnlineSwiftUI
//
//  Created by Marco Alonso Rodriguez on 16/06/23.
//

import SwiftUI

struct ProductsView: View {
    @StateObject private var viewModel = ProductViewModel(webservice: Webservice())
    
    var body: some View {
        NavigationView {
            List(viewModel.listProducts) { product in
                NavigationLink(destination: ImageProductDetailView(product: product)) {
                    HStack {
                        AsyncImage(url: URL(string: product.thumbnail)) { image in
                                   image
                                       .resizable()
                                       .aspectRatio(contentMode: .fill)
                                       
                               } placeholder: {
                                   ProgressView()
                               }
                               .frame(width: 60, height: 60)
                               .clipShape(Circle())
                               .shadow(radius: 12)
                            
                            
                        
                        VStack {
                            Text(product.title)
                                .font(.title2)
                            
                            HStack {
                                Text("$\(product.price)")
                                    Spacer()
                                Text("Disponibles: \(product.stock)")
                                    
                            }
                            .font(.footnote)
                        }
                        
                        
                    }
                    .frame(height: 80)
                    
                }
            }
            .frame(maxHeight: .infinity)
            .listStyle(.inset)
            .navigationBarTitle("Products", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
