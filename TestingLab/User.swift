//
//  User.swift
//  TestingLab
//
//  Created by Moaz Osama  on 12/05/2026.
//

import Foundation

struct ApiResponse: Codable {
    let users: [User]
}

struct User: Codable {
    let id: Int
    let username: String
    let password: String
    let email: String
}
