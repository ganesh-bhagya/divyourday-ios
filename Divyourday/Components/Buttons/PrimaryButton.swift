//
//  PrimaryButton.swift
//  Divyourday
//
//  Created by Ganesh Bhagya Sampath Wanigarathne on 2026-07-27.
//

import SwiftUI

struct PrimaryButton: View {

    let title: String
    let isLoading: Bool
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            HStack {

                if isLoading {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text(title)
                        .fontWeight(.semibold)
                }

            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color("PrimaryGreen"))
            .clipShape(RoundedRectangle(cornerRadius: 14))

        }
        .disabled(isLoading)

    }

}

#Preview {
    PrimaryButton(
        title: "Sign In",
        isLoading: false
    ) {

    }
    .padding()
}
