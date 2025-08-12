//
//  ContentView.swift
//  SmilePhoneApp
//
//  Created by Hualiteq International on 2025/8/8.
//

// the item are quite adorable and  fun the complete area and sera mas y mad t
// the roadmap is pretty fine so write the sentence and otros era
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
