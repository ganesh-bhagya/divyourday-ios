//
//  ScreenContainer.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-27.
//

import SwiftUI

struct ScreenContainer<Content: View>: View {
    
    let horizontolPadding: CGFloat
    
    @ViewBuilder
    
    let content: Content
    
    init(horizontolPadding: CGFloat = AppSpacing.lg, @ViewBuilder content: () -> Content) {
        self.horizontolPadding = horizontolPadding
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            AppColors.background
                .ignoresSafeArea()
            
            content
                .padding(.horizontal, horizontolPadding)
        }
    }
}

#Preview {
    ScreenContainer
    {
        Text("Hello")
    }
}
