//
//  SharedDataViewModel.swift
//  omega-eCommerce
//
//  Created by Logan Nguyễn on 7/4/22.
//

import SwiftUI

class SharedDataViewModel: ObservableObject {
    
    // Detail Product Data
    @Published var detailProduct: Product?
    @Published var showDetailProduct: Bool = false
    
    // matched Geometry Effect from Search Page
    @Published var fromSearchPage: Bool = false
    
    // Liked Products
    @Published var likedProducts: [Product] = []
    
    // Cart products
    @Published var cartProducts: [Product] = []
    
    // Calculating Total Price
    func getTotalPrice() -> String {
        var total: Int = 0
        
        cartProducts.forEach {product in
            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
            let quantity = product.quantity
            let priceTotal = price.integerValue * quantity
            total += priceTotal
        }
    
        return "$\(total)"
        
    }
    
}

