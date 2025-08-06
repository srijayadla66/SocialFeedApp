//
//  NewPostsBanner.swift
//  SocialFeedApp
//
//  Created by Namburi Rammohanrao on 8/6/25.
//
import SwiftUI

struct NewPostsBanner: View {
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Text("New posts available")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

