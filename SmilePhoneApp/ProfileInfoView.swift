//
//  ProfileInfoView.swift
//  SmilePhoneApp
//
//  Created by Hualiteq International on 2025/8/12.
//

import Foundation
import SwiftUI


// MARK: - Profile Info Component
struct ProfileInfoView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.secondary)
            
            Text(value)
                .font(.system(size: 20))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

