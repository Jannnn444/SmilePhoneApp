//
//  ContentView.swift
//  SmilePhoneApp
//
//  Created by Hualiteq International on 2025/8/8.
//

import SwiftUI

// MARK: - Content View (Root)
struct ContentView: View {
    var body: some View {
        NavigationView {
            GreetingView()
        } 
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
