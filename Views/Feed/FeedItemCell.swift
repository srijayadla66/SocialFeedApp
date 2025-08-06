//
//  FeedItemCell.swift
//  SocialFeedApp
//
//

import SwiftUI

struct FeedItemCell: View {
    var post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(post.author.username)
                .font(.headline)

            if post.type == .text {
                Text(post.content)
            } else if post.type == .image, let url = post.imageURL {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let img):
                        img.resizable().scaledToFit()
                    case .failure:
                        Image(systemName: "photo").resizable().scaledToFit()
                    @unknown default:
                        EmptyView()
                    }
                }
            } else if post.type == .video {
                Text("[Video content]")
            }

            Text(post.timestamp, style: .time)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
    }
}
