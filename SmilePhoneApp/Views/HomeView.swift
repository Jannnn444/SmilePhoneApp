//
//  HomeView.swift
//  SmilePhoneApp
//
//  Created by Hualiteq International on 2025/8/12.
//

import Foundation
import SwiftUI

// MARK: - Home Screen with Tab Navigation
struct HomeView: View {
    @State private var selectedTab = 0
    
    private let sampleContacts = [
        Contact(name: "John", phoneNumber: "123456789"),
        Contact(name: "Alice", phoneNumber: "987654321"),
        Contact(name: "Bob", phoneNumber: "123456788"),
        Contact(name: "Carol", phoneNumber: "333333333")
    ]
    
    var body: some View {
        TabView(selection: $selectedTab) {
            DialerView()
                .tabItem {
                    Image(systemName: "phone.circle.fill")
                    Text("Dialer")
                }
                .tag(0)
            
            VideoCallView(contacts: sampleContacts)
                .tabItem {
                    Image(systemName: "camera.fill")
                    Text("Video Call")
                }
                .tag(1)
            
            RecentCallsView(contacts: sampleContacts)
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("Recent")
                }
                .tag(2)
            
            ContactPageView(contacts: sampleContacts)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Contacts")
                }
                .tag(3)
            
            FavoritePageView(contacts: sampleContacts)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorite")
                }
                .tag(4)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "wheel.fill")
                    Text("Settings")
                }
               
            
            PersonalPageView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
                .tag(5)
               
        }
//      .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}
