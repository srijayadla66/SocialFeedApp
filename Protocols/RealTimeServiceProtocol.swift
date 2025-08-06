//
//  RealTimeServiceProtocol.swift
//  SocialFeedApp
//
//  Created by Namburi Rammohanrao on 8/6/25.
//

import Combine

public protocol RealTimeServiceProtocol {
    var newPostPublisher: AnyPublisher<Post, Never> { get }
    func start()
    func stop()
}
