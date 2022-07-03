//
//  OnBoardingPage.swift
//  omega-eCommerce
//
//  Created by Logan Nguyễn on 7/1/22.
//

import SwiftUI

// Custom fonts on all pages
let customFont = "Raleway-Regular"

struct OnBoardingPage: View {
    
    @State var showLoginPage: Bool = false
    
    var body: some View {
        // Hero section
        VStack(alignment: .leading){
            // Hero text
            Text("Find your \nGadget")
                .font(.custom(customFont, size: 55))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            // Hero image
            Image("OnBoard")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            // Hero button
            Button  {
                withAnimation {
                    showLoginPage = true
                }
            } label: {
                Text("Get Started with Omega")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.bold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color("Purple"))
            }
            .padding(.horizontal, 30)
            // adding some adjusments only for larger displays
            .offset(y: getRect().height < 750 ? 20: 40)
            
            Spacer()

        }
        .padding()
        .padding(.top, getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Purple"))
        .overlay(
            Group {
                if (showLoginPage) {
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
    }
}

// Extend View to get screen bounds
extension View {
    // get rectangle
    func getRect() -> CGRect{
        // CGRect contains locations and dimensions of a rectangle
        return UIScreen.main.bounds
    }
}
