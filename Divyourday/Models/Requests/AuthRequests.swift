//
//  AuthRequests.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-28.
//

import Foundation

struct LoginRequest: Codable {
    let email: String
    let password: String
}

struct RegisterRequest: Codable {
    let name: String
    let email: String
    let password: String
}

struct ForgotPasswordRequest: Codable {
    let email: String
}
