//
//  LoginPageModel.swift
//  omega-eCommerce
//
//  Created by Logan Nguyễn on 7/3/22.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    // Login props
    @Published var email: String = "" // @Published is a type that publishes a property marked with an attribute
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    // Register props
    @Published var confirmedPassword: String = ""
    @Published var showConfirmedPassword: String = ""
    
    
    func login() {
        // Login
    }
    
    func register() {
        // Login
    }
    
    func forgotPassword() {
        // Login
    }
}
