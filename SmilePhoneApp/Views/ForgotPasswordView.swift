//
//  ForgotPasswordiew.swift
//  SmilePhoneApp
//
//  Created by Hualiteq International on 2025/8/12.
//

import Foundation
import SwiftUI

// MARK: - Forgot Password Screen
struct ForgotPasswordView: View {
    @State private var email = ""
    @State private var navigateToConfirmation = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Send password to your email")
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.top, 40)
            
            TextField("Enter your email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .padding(.horizontal, 20)
            
            Button(action: {
                navigateToConfirmation = true
            }) {
                Text("Send")
                    .foregroundColor(.white)
                    .frame(width: 100, height: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            Spacer()
            
            NavigationLink(destination: PasswordSentView(), isActive: $navigateToConfirmation) {
                EmptyView()
            }
        }
        .navigationTitle("Forgot Password")
        .navigationBarTitleDisplayMode(.inline)
    }
}
