//
//  DialerView.swift
//  SmilePhoneApp
//
//  Created by Hualiteq International on 2025/8/12.
//

import Foundation
import SwiftUI

// MARK: - Dialer View for Making Calls
struct DialerView: View {
    @State private var phoneNumber = ""
    @State private var showCallAlert = false
    
    private let buttonTitles = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["*", "0", "#"]
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Hi, Dear Janus Welcome Smile Home")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            // Phone Number Display
            VStack(spacing: 10) {
                Text("Phone Number")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.secondary)
                
                Text(phoneNumber.isEmpty ? "Enter number" : phoneNumber)
                    .font(.system(size: 32, weight: .medium, design: .monospaced))
                    .foregroundColor(phoneNumber.isEmpty ? .secondary : .primary)
                    .frame(minHeight: 40)
            }
            .padding(.horizontal, 20)
            
            // Dialer Keypad
            VStack(spacing: 15) {
                ForEach(0..<buttonTitles.count, id: \.self) { rowIndex in
                    HStack(spacing: 20) {
                        ForEach(0..<buttonTitles[rowIndex].count, id: \.self) { columnIndex in
                            let title = buttonTitles[rowIndex][columnIndex]
                            
                            Button(action: {
                                phoneNumber += title
                            }) {
                                Text(title)
                                    .font(.system(size: 28, weight: .medium))
                                    .foregroundColor(.primary)
                                    .frame(width: 75, height: 75)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(37.5)
                            }
                        }
                    }
                }
            }
            
            // Action Buttons
            HStack(spacing: 30) {
                // Delete Button
                Button(action: {
                    if !phoneNumber.isEmpty {
                        phoneNumber.removeLast()
                    }
                }) {
                    Image(systemName: "delete.left.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.red)
                        .frame(width: 60, height: 60)
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(30)
                }
                .disabled(phoneNumber.isEmpty)
                
                // Call Button
                Button(action: {
                    makeCall()
                }) {
                    Image(systemName: "phone.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .frame(width: 75, height: 75)
                        .background(Color.green)
                        .cornerRadius(37.5)
                }
                .disabled(phoneNumber.isEmpty)
                
                // Clear Button
                Button(action: {
                    phoneNumber = ""
                }) {
                    Image(systemName: "clear.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.orange)
                        .frame(width: 60, height: 60)
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(30)
                }
                .disabled(phoneNumber.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .alert("Calling...", isPresented: $showCallAlert) {
            Button("End Call") { }
        } message: {
            Text("Calling \(phoneNumber)")
        }
    }
    
    private func makeCall() {
        showCallAlert = true
        // In a real app, this would initiate an actual phone call
        // using CallKit or similar framework
    }
}
