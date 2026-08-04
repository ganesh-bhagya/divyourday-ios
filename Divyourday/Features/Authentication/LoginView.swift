//
//  LoginView.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-27.
//

import SwiftUI

struct LoginView: View {
    
    
    @State private var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    var body: some View {
        ScreenContainer {
            VStack(alignment: .leading, spacing: AppSpacing.md) {
                
                HStack(spacing: AppSpacing.sm) {
                    Image(systemName: "leaf.fill")
                        .foregroundStyle(AppColors.primary)
                        .font(.title2)
                    
                    Text("Divyourday")
                        .font(.title3)
                        .foregroundStyle(AppColors.primary)
                        .fontWeight(.bold)
                }
                .padding(.top, 50)
                
                Text("Welcome back")
                    .font(.system(size: 40, weight: .bold))
                    .padding(.top, 50)
                
                Text("Sign in to manage groups and your wallet")
                    .foregroundStyle(.secondary)
                
                GoogleButton {
                    
                }
                
                DividerWithText(text: "or continue with email")
                
                
                AppTextField(title: "Email Address", placeholder: "you@example.com", text: $viewModel.email)
                
                PasswordField(title: "Password", placeholder: "Enter your passowrd", password: $viewModel.password)
                
                
                
                PrimaryButton(
                    title: "Sign In",
                    isLoading: viewModel.isLoading
                ) {
                    
                    Task {
                        await viewModel.login()
                    }
                }
                
            }
        }
    }
}

#Preview {
    let apiClient = APIClient()
    let authService = AuthService(apiClient: apiClient)
    let sessionManager = SessionManager()

    LoginView(
        viewModel: LoginViewModel(
            authService: authService,
            sessionManager: sessionManager
        )
    )
}
