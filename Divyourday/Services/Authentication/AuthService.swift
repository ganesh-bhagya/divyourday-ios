//
//  AuthService.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-28.
//

import Foundation


final class AuthService: AuthServiceProtocol {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func login(request: LoginRequest) async throws -> Session {
        
        try await apiClient.post(endpoint: Endpoints.login, request: request)
    }
    
    func register(email: String, password: String, name: String) async throws -> Session {
        fatalError("Not Implemented")
    }
    

    
}
