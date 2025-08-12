//
//  LoginView.swift
//  SmilePhoneApp
//
//  Created by Hualiteq International on 2025/8/12.
//

import Foundation
import SwiftUI

// MARK: - Login Screen with Account/Password Fields
struct LoginView: View {
    @State private var account = ""
    @State private var password = ""
    @State private var navigateToHome = false
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Log In")
                .font(.system(size: 24, weight: .medium))
                .padding(.top, 40)
            
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Account")
                        .font(.system(size: 20, weight: .medium))
                    
                    TextField("Enter your account", text: $account)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Password")
                        .font(.system(size: 20, weight: .medium))
                    
                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .padding(.horizontal, 20)
            
            Button(action: {
                handleLogin()
            }) {
                Text("Go")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color.blue )
                    .cornerRadius(8)
            }
            .padding(.horizontal, 20)
            .disabled(account.isEmpty || password.isEmpty)
            NavigationLink(destination: ForgotPasswordView()) {
                Text("Forgot Password?")
                    .foregroundColor(.blue)
            }
            
            Spacer()
            
            NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
                EmptyView()
            }
        }
        .navigationTitle("Log In")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Login Failed", isPresented: $showAlert) {
            Button("OK") { }
        } message: {
            Text("Please check your account and password.")
        }
    }
    
    private func handleLogin() {
        // Simple validation - in real app, this would be actual authentication
        if !account.isEmpty && !password.isEmpty {
            navigateToHome = true
        } else {
            showAlert = true
        }
    }
}
