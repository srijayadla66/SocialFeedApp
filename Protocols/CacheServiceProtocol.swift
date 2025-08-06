//
//  CacheServiceProtocol.swift
//  SocialFeedApp
//
//  Created by Namburi Rammohanrao on 8/6/25.
//

public protocol CacheServiceProtocol {
    func savePosts(_ posts: [Post])
    func loadCachedPosts() -> [Post]
}
