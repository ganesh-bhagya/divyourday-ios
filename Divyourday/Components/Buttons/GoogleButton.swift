//
//  GoogleButton.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-27.
//

import SwiftUI

struct GoogleButton: View {
    
    let action: () -> Void
    
    private let cornerRadius: CGFloat = 14
    
    
    var body: some View {
        
        Button(action: action) {
            
            HStack(spacing: 12) {
                Image("google")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                Text("Continue with Google")
                    .fontWeight(.medium)
                    .font(.body)
                    .foregroundStyle(.black)
                    
            }
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 2)
            }
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        }
    }
}

#Preview {
    GoogleButton {
        
    }
    .padding()
}
