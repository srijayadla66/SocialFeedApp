//
//  RealTimeService.swift
//  SocialFeedApp
//
//
import Foundation
import Combine

final class RealTimeService: RealTimeServiceProtocol {
    var newPostPublisher: AnyPublisher<Post, Never> { Empty().eraseToAnyPublisher() }
    func start() {}
    func stop() {}
}

