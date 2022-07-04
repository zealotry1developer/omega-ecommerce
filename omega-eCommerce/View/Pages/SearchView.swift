//
//  SearchView.swift
//  omega-eCommerce
//
//  Created by Logan Nguyễn on 7/4/22.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var homeData: HomeViewModel
    
    // activate text fied with the help of focus state
    @FocusState var startTF: Bool
    
    var animation: Namespace.ID
    
    var body: some View {
        
        VStack(spacing: 0) {
            // Search bar
            HStack(spacing: 15) {
                // Close Button
                Button {
                    withAnimation {
                        homeData.searchActivated = false
                    }
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(Color.black.opacity(0.7))
                }
                
                // Search bar
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    TextField("Search...", text: $homeData.searchText)
                        .focused($startTF)
                        .textCase(.lowercase)
                        .disableAutocorrection(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .strokeBorder(Color("Purple"), lineWidth: 1.5)
                )
                .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                .padding(.trailing, 20)
            }
            .padding([.horizontal])
            .padding(.top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("HomeBG").ignoresSafeArea())
        .onAppear() { // help text focus right after appear
            // DispatchQyeye.main is in main thread and for UI related tasks
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                startTF = true
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
