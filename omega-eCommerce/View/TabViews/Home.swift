//
//  Home.swift
//  omega-eCommerce
//
//  Created by Logan Nguyễn on 7/3/22.
//

import SwiftUI

struct Home: View {
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
                
                // Greet text
                Text("Order online \ncollect in store")
                    .font(.custom(customFont, size: 28).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal, 25)
            }
            .padding()
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
