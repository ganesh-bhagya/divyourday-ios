//
//  HomeView.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-29.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("🎉 Login Successful")
                    .font(.largeTitle)

                Text("Welcome to Divyourday")
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
