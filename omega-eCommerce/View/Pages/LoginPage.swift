//
//  LoginPage.swift
//  omega-eCommerce
//
//  Created by Logan Nguyễn on 7/3/22.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    @State var showMainPage: Bool = false
    
    var body: some View {
        
        VStack {
            // Welcome back text
            Text("Welcome to\nOmega")
                .font(
                    .custom(customFont, size: 55)
                    .bold()
                )
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: getRect().height / 4.5)
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
                // Login forms
                VStack (spacing: 15) {
                    Text(loginData.registerUser ? "Register" : "Login")
                        .font(.custom(customFont, size: 22).bold())
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    
                    // Custom Text Fields
                    // Email
                    CustomTextField(
                        icon: "envelope",
                        title: "Email",
                        hint: "Email ID",
                        value: $loginData.email,
                        showPassword: .constant(false)
                    )
                    .padding(.top, 30)
                    
                    // Email
                    CustomTextField(
                        icon: "lock",
                        title: "Password",
                        hint: "Password",
                        value: $loginData.password,
                        showPassword: $loginData.showPassword
                    )
                    .padding(.top, 10)
                    
                    // Show confirm password field only if user is registering
                    if (loginData.registerUser) {
                        CustomTextField(
                            icon: "lock",
                            title: "Confirm Password",
                            hint: "Confirm Password",
                            value: $loginData.confirmedPassword,
                            showPassword: $loginData.showConfirmedPassword
                        )
                        .padding(.top, 10)
                    }
                    
                    // Forgot Password button
                    Button {
                        loginData.forgotPassword()
                    } label: {
                        Text("Forgot password?")
                            .font(.custom(customFont, size: 16))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Purple"))
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Login Button
                    Button {
                        if (loginData.registerUser) {
                            loginData.register()
                        } else {
                            loginData.login()
                        }
                    } label: {
                        Text("Login")
                            .font(.custom(customFont, size: 20).bold())
                            .padding(.vertical, 20)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color("Purple"))
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                            
                    }
                    .padding(.top, 25)
                    .padding(.horizontal)
                    
                    VStack (spacing: 10) {
                        // Register User button
                        Button {
                            withAnimation {
                                loginData.registerUser.toggle()
                            }
                        } label: {
                            Text(loginData.registerUser ? "Back to login" : "Not on Omega yet? Sign up")
                                .font(.custom(customFont, size: 16))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Purple"))
                        }
                        .padding(.top, 8)
                        .frame(maxWidth: .infinity)
                        
                        // Browse Omega as Guest
                        Button {
                            withAnimation(.easeInOut) {
                                showMainPage = true
                            }
                        } label: {
                            Text("Browse Omega as guest")
                                .font(.custom(customFont, size: 15))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Purple").opacity(0.9))
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                    
                }
                .padding(30)
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
        // Clearing data when changes
        .onChange(of: loginData.registerUser) {newValue in
            loginData.email = ""
            loginData.password = ""
            loginData.confirmedPassword = ""
            loginData.showPassword = false
            loginData.showConfirmedPassword = false
        }
        .overlay (
            Group {
                if (showMainPage) {
                    MainPage()
                }
            }
        )
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
            
            if (title.contains("Password") && !showPassword.wrappedValue) {
                SecureField(hint, text: value)
                    .padding(.top, 2)
            } else {
                TextField(hint, text: value)
                    .padding(.top, 2)
            }
            
            Divider()
                .background(Color.black.opacity(0.4))
        }
        // ShowPassword button
        .overlay(
            Group {
                if (title.contains("Password")) {
                    Button (
                        action: {
                            showPassword.wrappedValue.toggle()
                        },
                        label: {
                            Text(showPassword.wrappedValue ? "Hide" : "Show")
                                .font(.custom(customFont, size: 14).bold())
                                .foregroundColor(Color("Purple"))
                        }
                    )
                    .offset(y: 9)
                }
            },
            alignment: .trailing
        )
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
