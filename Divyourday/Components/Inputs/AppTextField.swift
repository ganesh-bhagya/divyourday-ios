//
//  AppTextField.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-27.
//

import SwiftUI

struct AppTextField: View {
    
    let title: String
    let placeholder: String
    
    
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
            
            TextField(placeholder, text: $text)
                .padding()
                .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }
}

#Preview {
    @Previewable @State var email = ""

       AppTextField(
           title: "Email address",
           placeholder: "you@example.com",
           text: $email
       )
       .padding()
}
