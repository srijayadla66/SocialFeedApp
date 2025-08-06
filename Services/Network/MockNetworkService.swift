//
//  MockNetworkService.swift
//  SocialFeedApp
//
//

import Foundation
import Combine

final class MockNetworkService: NetworkServiceProtocol {
    func fetchInitialPosts() -> AnyPublisher<[Post], Error> {
        let posts = MockDataGenerator.generatePosts(count: 10)
        return Just(posts)
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func fetchNewerPosts(after date: Date) -> AnyPublisher<[Post], Error> {
        let posts = MockDataGenerator.generatePosts(count: 2, newerThan: date)
        return Just(posts)
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func fetchOlderPosts(before date: Date) -> AnyPublisher<[Post], Error> {
        let posts = MockDataGenerator.generatePosts(count: 5, olderThan: date)
        return Just(posts)
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
