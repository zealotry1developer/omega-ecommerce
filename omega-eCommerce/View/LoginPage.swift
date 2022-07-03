//
//  LoginPage.swift
//  omega-eCommerce
//
//  Created by Logan Nguyễn on 7/3/22.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    
    var body: some View {
        
        VStack {
            // Welcome back text
            Text("Welcome\nback")
                .font(
                    .custom(customFont, size: 55)
                    .bold()
                )
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: getRect().height / 3.5)
                .padding()
                .background(
                    ZStack {
                        
                        // gradient circle
                        LinearGradient(
                            colors: [
                                Color("LoginCircle"),
                                Color("LoginCircle").opacity(0.8),
                                Color("Purple")
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .padding(.trailing)
                        .offset(y: -25)
                        .ignoresSafeArea()
                        
                        // small circles
                        Circle()
                            .strokeBorder(
                                Color.white.opacity(0.3),
                                lineWidth: 3
                            )
                            .frame(width: 30, height: 30)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding(30)
                        
                        Circle()
                            .strokeBorder(
                                Color.white.opacity(0.3),
                                lineWidth: 3
                            )
                            .frame(width: 23, height: 23)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(.leading, 30)
                        
                    }
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
                    .ignoresSafeArea()
            )
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Purple"))
    }
    
    @ViewBuilder // helps create child views
    func CustomTextField(
        icon: String,
        title: String,
        hint: String,
        value: Binding<String>,
        showPassword: Binding<Bool>
    ) -> some View {
        
        VStack (alignment: .leading, spacing: 12) {
            Label {
                Text(title)
                    .font(.custom(customFont, size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            TextField(hint, text: value)
            Divider()
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
