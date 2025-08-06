//
//  Errorview.swift
//  SocialFeedApp
//
//

import SwiftUI

struct ErrorView: View {
    var error: Error
    var retryAction: () -> Void

    var body: some View {
        VStack {
            Text("Error: \(error.localizedDescription)")
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding()

            Button("Retry", action: retryAction)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}
