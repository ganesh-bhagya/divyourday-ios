//
//  ContentView.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Welcome to")
            
            Text("Diveyourday")
                .font(.system(size: 42))
                .foregroundStyle(Color("PrimaryGreen"))
                .fontWeight(.bold)
            
            Button {
            } label: {
                Text("Let's Go")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("PrimaryGreen"))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
