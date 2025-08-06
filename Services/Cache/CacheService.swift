//
//  CacheService.swift
//  SocialFeedApp
//
//
import Foundation

final class CacheService: CacheServiceProtocol {
    private let userDefaults = UserDefaults.standard
    private let key = "cached_posts"

    func savePosts(_ posts: [Post]) {
        if let data = try? JSONEncoder().encode(posts) {
            userDefaults.set(data, forKey: key)
        }
    }

    func loadCachedPosts() -> [Post] {
        guard
            let data = userDefaults.data(forKey: key),
            let posts = try? JSONDecoder().decode([Post].self, from: data)
        else {
            return []
        }
        return posts
    }
}

