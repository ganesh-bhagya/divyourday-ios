//
//  LoginViewModel.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-27.
//

import Foundation


@Observable
class LoginViewModel {
    
    private let authService: AuthServiceProtocol
    private let sessionManager: SessionManagerProtocol
    
    init(authService: AuthServiceProtocol, sessionManager: SessionManagerProtocol) {
        self.authService = authService
        self.sessionManager = sessionManager
        
#if DEBUG
        email = "john@example.com"
        password = "SecurePass1!"
#endif
    }
    
    var email = ""
    var password = ""
    var emailError: String?
    var passwordError: String?
    var loginError : String?
    
    var isValidForm: Bool {
        emailError == nil && passwordError == nil && !email.isEmpty && !password.isEmpty
    }
    
    
    var isLoading = false
    
    func validateEmail() -> Bool {
        if email.isEmpty {
            emailError = "Please Enter an email"
            return false
        }
        if !email.contains("@") {
            emailError = "Please enter a valid email."
            return false
        }
        
        emailError = nil
        return true
        
    }
    
    func validatePassword() -> Bool {
        if password.isEmpty {
            passwordError = "Please Enter a password"
            return false
        }
        if password.count < 8 {
            passwordError = "Password must be at least 8 characters."
            return false
        }
        
        passwordError = nil
        return true
    }
    
    
    func validateForm() -> Bool {
        let emailValid = validateEmail()
        
        let passwordValid = validatePassword()
        
        return emailValid && passwordValid
    }
    
    func login() async {
        
        guard validateForm() else {
            return
        }
        
        
        isLoading = true
        defer {
            isLoading = false
        }
        
        do {
            let request = LoginRequest(email: email, password: password)
            
            let session = try await authService.login(request: request)
            
            sessionManager.save(session)
        } catch {
            loginError = error.localizedDescription
        }
        
        
    }
}


