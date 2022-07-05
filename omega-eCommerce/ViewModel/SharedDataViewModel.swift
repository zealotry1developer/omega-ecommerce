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
    
}

