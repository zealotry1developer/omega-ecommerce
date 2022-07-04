//
//  Home.swift
//  omega-eCommerce
//
//  Created by Logan Nguyễn on 7/3/22.
//

import SwiftUI

struct Home: View {
    
    @Namespace var animation
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack (spacing: 15) {
                
                // Search bar
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    TextField("Search...", text: .constant(""))
                        .disabled(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .strokeBorder(Color.gray, lineWidth: 0.8)
                )
                .frame(width: getRect().width / 1.6)
                .padding(.horizontal, 25)
                
                // Greeting text
                Text("Order online \ncollect in store")
                    .font(.custom(customFont, size: 28).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                // Product Tab
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 18) {
                        ForEach(ProductType.allCases, id: \.self) { type in
                            ProductTypeView(type: type)
                        }
                    }
                    .padding(.horizontal, 25)
                }
                .padding(.top, 28)
                
                // Products Page
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 25) {
                        
                        ForEach(homeData.filteredProducts) { product in
                            // Product Card View
                            ProductCardView(product: product)
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom)
                    .padding(.top, 80)
                }
                .padding(.top, 30)
                
                // See more button to show all the products
                Button {
                    
                } label: {
                    Label {
                        Image(systemName: "arrow.right")
                    } icon: {
                        Text("see more")
                    }
                    .foregroundColor(Color("Purple"))
                    .font(.custom(customFont, size: 15).bold())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                .padding(.trailing)
                .padding(.top, 10)
            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("HomeBG"))
        // Update data whenever tab changes
        .onChange(of: homeData.productType) { newValue in
            homeData.filterProductByType()
        }
    }
    
        .background(
            Color("HomeBG")
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
