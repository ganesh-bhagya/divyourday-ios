//
//  DividerWithText.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-27.
//

import SwiftUI

struct DividerWithText: View {
    
    let text: String
    var body: some View {
        
        HStack(spacing: AppSpacing.lg) {
            Rectangle()
                .frame(height: 2)
                   .frame(maxWidth: .infinity)
                .foregroundStyle(AppColors.secondary.opacity(0.6))
            Text(text)
                .font(.footnote)
                .lineLimit(1)
                .fixedSize()
            Rectangle()
                .frame(height: 2)
                   .frame(maxWidth: .infinity)
                .foregroundStyle(AppColors.secondary.opacity(0.6))
        }
        .padding(6)
    }
}


#Preview {
    DividerWithText(text: "OR")
}
