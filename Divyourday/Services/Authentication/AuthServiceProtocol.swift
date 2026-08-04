//
//  AuthServiceProtocol.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-28.
//

import Foundation


protocol AuthServiceProtocol {
    func login(request: LoginRequest) async throws -> Session
    func register(email: String, password: String, name: String) async throws  -> Session
    
}
