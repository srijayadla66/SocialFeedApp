//
//  User.swift
//  SocialFeedApp
//
//  Created by Namburi Rammohanrao on 8/6/25.
//

import Foundation

public struct User: Identifiable, Codable, Equatable {
    public let id: UUID
    public let username: String
    public let avatarURL: URL?
}
