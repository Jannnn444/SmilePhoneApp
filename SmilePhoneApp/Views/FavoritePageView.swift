//
//  FavoritePageView.swift
//  SmilePhoneApp
//
//  Created by Hualiteq International on 2025/8/12.
//

import Foundation
import SwiftUI

// MARK: - Favorite Page
struct FavoritePageView: View {
    let contacts: [Contact]
    
    var body: some View {
        VStack {
            Text("Favorites")
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
