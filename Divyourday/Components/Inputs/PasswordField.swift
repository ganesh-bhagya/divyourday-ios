//
//  PasswordField.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-27.
//

import SwiftUI

struct PasswordField: View {
    
    let title: String
    let placeholder: String
    
    @Binding var password: String
    
    @State private var isSecured = true
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
            
            HStack {
                if isSecured {
                    SecureField(placeholder, text: $password)
                } else {
                    
                    TextField(placeholder, text: $password)
                    
                }
                
                Button {
                    withAnimation(.easeInOut) {
                        isSecured.toggle()
                    }
                } label: {
                    Image(
                        systemName: isSecured
                        ? "eye.slash"
                        : "eye"
                    )
                    .foregroundStyle(.gray)
                }
            }
            .padding()
            .background(Color(.white))
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }
}

#Preview {
    @Previewable @State var password = ""
    
    PasswordField(
        title: "Password",
        placeholder: "••••••••",
        password: $password
    )
    .padding()
}
