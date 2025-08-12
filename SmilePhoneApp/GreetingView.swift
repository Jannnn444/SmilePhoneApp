//
//  GreetingView.swift
//  SmilePhoneApp
//
//  Created by Hualiteq International on 2025/8/12.
//

import Foundation
import SwiftUI

// MARK: - Greeting/Welcome Screen
struct GreetingView: View {
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("😄")
                .font(.system(size: 80))
            
            Text("Hi, Welcome Smile Phone App")
                .font(.system(size: 18))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Spacer()
            
            NavigationLink(destination: LoginView()) {
                Text("Continue")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
                    .frame(width: 120, height: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            Spacer()
        }
        .navigationBarHidden(true)
    }
}
