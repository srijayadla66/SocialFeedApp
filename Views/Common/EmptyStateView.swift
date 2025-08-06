//
//  EmptyStateView.swift
//  SocialFeedApp
//
//

import SwiftUI

struct EmptyStateView: View {
    var message: String

    var body: some View {
        Text(message)
            .foregroundColor(.gray)
            .font(.headline)
            .padding()
    }
}

