//
//  MockDataGenerator.swift
//  SocialFeedApp
//
//

import Foundation

struct MockDataGenerator {
    static func generatePosts(count: Int, newerThan: Date? = nil, olderThan: Date? = nil) -> [Post] {
        var posts: [Post] = []
        for i in 1...count {
            let user = User(
                id: UUID(),
                username: "user\(Int.random(in:1...1000))",
                avatarURL: nil
            )
            let date: Date = {
                if let n = newerThan {
                    return Date(timeInterval: .random(in: 60...3600), since: n)
                } else if let o = olderThan {
                    return Date(timeInterval: -.random(in: 60...3600), since: o)
                } else {
                    return Date().addingTimeInterval(-Double(i * 60))
                }
            }()
            let type: FeedItemType = [.text, .image, .video].randomElement()!
            let content = type == .text
                ? "This is a sample post #\(i)"
                : "https://picsum.photos/200/300?random=\(i)"
            let imageURL = type == .image ? URL(string: content) : nil
            let videoURL = type == .video ? URL(string: content) : nil

            let post = Post(
                id: UUID(),
                author: user,
                timestamp: date,
                type: type,
                content: content,
                imageURL: imageURL,
                videoURL: videoURL
            )

            posts.append(post)
        }
        return posts
    }
}
