//
//  HomeViewModel.swift
//  omega-eCommerce
//
//  Created by Logan Nguyễn on 7/4/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var productType: ProductType = .Wearable
    
    // Sample products
    @Published var products: [Product] = [
    
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6: Red", price: "$359",productImage: "AppleWatch6"),
        Product(type: .Wearable, title: "Samsung Watch", subtitle: "Gear: Black", price: "$180", productImage: "SamsungWatch"),
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 4: Black", price: "$250", productImage: "AppleWatch4"),
        Product(type: .Phones, title: "iPhone 13", subtitle: "A15 - Pink", price: "$699", productImage: "iPhone13"),
        Product(type: .Phones, title: "iPhone 12", subtitle: "A14 - Blue", price: "$599", productImage: "iPhone12"),
        Product(type: .Phones, title: "iPhone 11", subtitle: "A13 - Purple", price: "$499", productImage: "iPhone11"),
        Product(type: .Phones, title: "iPhone SE 2", subtitle: "A13 - White", price: "$399", productImage: "iPhoneSE"),
        Product(type: .Laptops, title: "MacBook Air", subtitle: "M1 - Gold", price: "$999", productImage: "MacBookAir"),
        Product(type: .Laptops, title: "MacBook Pro", subtitle: "M1 - Space Grey", price: "$1299", productImage: "MacBookPro"),
        Product(type: .Tablets, title: "iPad Pro", subtitle: "M1 - Silver", price: "$999", productImage: "iPadPro"),
        Product(type: .Tablets, title: "iPad Air 4", subtitle: "A14 - Pink", price: "$699", productImage: "iPadAir"),
        Product(type: .Tablets, title: "iPad Mini", subtitle: "A15 - Grey", price: "$599", productImage: "iPadMini"),
        Product(type: .Laptops, title: "iMac", subtitle: "M1 - Purple", price: "$1599", productImage: "iMac"),
    ]
    
    // Filtered products
    @Published var filteredProducts: [Product] = []
    
    // More products on type
    @Published var showMoreProductsOnType: Bool = false
    
    // Search Data
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    
    
    init() {
       filterProductByType()
    }
    
    func filterProductByType() {
        // filter by product type
        
        /**
         DispatchQueue.global is executed in the background thread, not in the main thread
         Background thread is used to for the non-UI tasks most of the time.
         The tasks would consume time and need async/await, like calling API or filtering etc.
         
         DispatchQueue.global is managed by system, which can manage background thread by using qos (Quality of Service)
         
         // More about Main and Background thread at: https://towardsdev.com/ios-introducing-dispatchqueue-in-swift-e9c6fbf8be1d
         */
        
        /**
        UserInteractive is the highest priority QoS. System will give more resources for this setting, should be used for UI and animation related tasks
         */
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
                .lazy // since this will require more memory so "lazy" is used to perform more -- used for filter or map
                .filter { product in
                    return product.type == self.productType
                }
                .prefix(4) // limiting results to 4 products
            
            /**
             DispatchQueue.main is the queue to manage the main thread to update UI
             */
            DispatchQueue.main.async {
                self.filteredProducts = results.compactMap({ product in
                    return product
                })
            }
        }
        
    }
    
}
