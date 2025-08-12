//
//  ContactPageView.swift
//  SmilePhoneApp
//
//  Created by Hualiteq International on 2025/8/12.
//

import Foundation
import SwiftUI

// MARK: - Contact Page
struct ContactPageView: View {
    let contacts: [Contact]
    
    var body: some View {
        VStack {
            Text("Contact Book")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            List(contacts) { contact in
                ContactRowView(contact: contact)
            }
        }
    }
}
