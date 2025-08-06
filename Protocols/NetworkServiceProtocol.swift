//
//  NetworkServiceProtocol.swift
//  SocialFeedApp
//
//

import Foundation
import Combine

public protocol NetworkServiceProtocol {
    func fetchInitialPosts() -> AnyPublisher<[Post], Error>
    func fetchNewerPosts(after date: Date) -> AnyPublisher<[Post], Error>
    func fetchOlderPosts(before date: Date) -> AnyPublisher<[Post], Error>
}
