//
//  User.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-28.
//

import Foundation


struct User: Codable {
    let id: String
    let email: String
    let name: String
    let avatarUrl: String?
    let currency: String
    let timezone: String
    let darkMode: Bool
    let createdAt: Date
}
