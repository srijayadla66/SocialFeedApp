//
//  UserDefaultsCacheService.swift
//  SocialFeedApp
//
//
import Foundation

final class UserDefaultsCacheService: CacheServiceProtocol {
    private let theCache = CacheService()
    func savePosts(_ posts: [Post]) {
        theCache.savePosts(posts)
    }
    func loadCachedPosts() -> [Post] {
        theCache.loadCachedPosts()
    }
}
