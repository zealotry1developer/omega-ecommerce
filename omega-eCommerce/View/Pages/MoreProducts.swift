//
//  MoreProducts.swift
//  omega-eCommerce
//
//  Created by Logan Nguyễn on 7/4/22.
//

import SwiftUI

struct MoreProducts: View {
    var body: some View {
        VStack {
            Text("More Products")
                .font(.custom(customFont, size: 24).bold())
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color("HomeBG").ignoresSafeArea())
    }
}

struct MoreProducts_Previews: PreviewProvider {
    static var previews: some View {
        MoreProducts()
    }
}
