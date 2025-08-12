//
//  PersonalPageView.swift
//  SmilePhoneApp
//
//  Created by Hualiteq International on 2025/8/12.
//

import Foundation
import SwiftUI

// MARK: - Personal Profile Page
struct PersonalPageView: View {
    @Environment(\.presentationMode) var presentationMode
    
    private let user = User(
        firstName: "Janus",
        lastName: "Huang",
        account: "janus@gmail.com",
        registeredDate: "2025/08/01"
    )
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Personal Information")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                VStack(spacing: 20) {
                    ProfileInfoView(title: "Name", value: user.firstName)
                    ProfileInfoView(title: "Last Name", value: user.lastName)
                    ProfileInfoView(title: "Account", value: user.account)
                    ProfileInfoView(title: "Password", value: "●●●●●●●●●●")
                    ProfileInfoView(title: "Registered Date", value: user.registeredDate)
                }
                .padding(.horizontal, 20)
                
                Button(action: {
                    // Navigate back to root (logout)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Log Out")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(Color.red)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
        }
    }
}
