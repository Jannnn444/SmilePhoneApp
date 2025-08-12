//
//  PasswordSentView.swift
//  SmilePhoneApp
//
//  Created by Hualiteq International on 2025/8/12.
//

import Foundation
import SwiftUI

// MARK: - Password Sent Confirmation
struct PasswordSentView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("Your password (that been sent to your email) !")
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Button(action: {
                // Navigate back to root
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("OK !")
                    .foregroundColor(.white)
                    .frame(width: 100, height: 44)
                    .background(Color.green)
                    .cornerRadius(8)
            }
            
            Spacer()
        }
        .navigationTitle("Password Sent")
        .navigationBarTitleDisplayMode(.inline)
    }
}
