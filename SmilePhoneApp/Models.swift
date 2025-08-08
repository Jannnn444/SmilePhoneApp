//
//  Models.swift
//  SmilePhoneApp
//
//  Created by Hualiteq International on 2025/8/8.
//

import Foundation

// MARK: - Models
struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let phoneNumber: String
}

struct User {
    let firstName: String
    let lastName: String
    let account: String
    let registeredDate: String
}
