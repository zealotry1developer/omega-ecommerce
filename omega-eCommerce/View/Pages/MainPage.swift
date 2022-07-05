//
//  MainPage.swift
//  omega-eCommerce
//
//  Created by Logan Nguyễn on 7/3/22.
//

import SwiftUI

struct MainPage: View {
    
    // Current tab
    @State var currentTab: Tab = .Home
    
    // SharedDataModel
    @StateObject var sharedData: SharedDataViewModel = SharedDataViewModel()
    
    // animation namespace -- @Namespace is the wrapper for Namespace.ID, use @Namespace in the parentView, then pass Namespace.ID to child views
    @Namespace var animation
    
    // Hiding tab bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            // Tab Views
            TabView(selection: $currentTab) {
                Home(animation: animation)
                    .environmentObject(sharedData)
                    .tag(Tab.Home)
                
                Text("Liked")
                    .tag(Tab.Liked)
                
                Profile()
                    .tag(Tab.Profile)
                
                Text("Cart")
                    .tag(Tab.Cart)
            }
            
            // Custom Tab bar
            HStack(spacing: 0) {
                
                // Iterate through Tabs
                ForEach(Tab.allCases, id: \.self){tab in
                    Button {
                        // Update tabs
                        currentTab = tab
                    } label: {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template) // Makes changing foregroundColor possible
                            .foregroundColor(
                                currentTab == tab ? Color("Purple") : Color.black.opacity(0.8))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .background(
                                Color("Purple")
                                    .opacity(0.2)
                                    .cornerRadius(5)
                                    .padding(-7)
                                    .blur(radius: 5)
                                    .opacity(currentTab == tab ? 1 : 0)
                            )
                            .frame(maxWidth: .infinity)
                            
                            
                    }
                }
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 10)
        }
        .background(Color("HomeBG").ignoresSafeArea())
        .overlay(
            ZStack {
                // Detail Page
                if let product = sharedData.detailProduct, sharedData.showDetailProduct {
                     ProductDetailPage(product: product, animation: animation)
                        .environmentObject(sharedData)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
            }
        )
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

// Tab cases
enum Tab: String, CaseIterable {
    case Home = "Home"
    case Liked = "Liked"
    case Profile = "Profile"
    case Cart = "Cart"
}
