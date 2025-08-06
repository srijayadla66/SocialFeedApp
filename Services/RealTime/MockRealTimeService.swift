//
//  MockRealTimeService.swift
//  SocialFeedApp
//
//

import Foundation
import Combine

final class MockRealTimeService: RealTimeServiceProtocol {
    private let subject = PassthroughSubject<Post, Never>()
    var newPostPublisher: AnyPublisher<Post, Never> {
        subject.eraseToAnyPublisher()
    }

    private var timer: Timer?

    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 8, repeats: true) { [weak self] _ in
            let new = MockDataGenerator.generatePosts(count: 1).first!
            self?.subject.send(new)
        }
    }

    func stop() {
        timer?.invalidate()
        timer = nil
    }
}
