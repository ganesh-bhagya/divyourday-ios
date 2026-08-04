//
//  AppContainer.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-28.
//

import Foundation


final class AppContainer {

    let apiClient = APIClient()

    lazy var authService = AuthService(apiClient: apiClient)
    
    lazy var sessionManager = SessionManager()

    
    func makeLoginView() -> LoginView {
        LoginView(
            viewModel: LoginViewModel(
                authService: authService,
                sessionManager: sessionManager
            )
        )
    }
    
    func makeHomeView() -> HomeView {
        HomeView()
    }
}
