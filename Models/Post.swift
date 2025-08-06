//
//  Post.swift
//  SocialFeedApp
//
//
import Foundation

public enum FeedItemType: String, Codable {
    case text, image, video, poll, ad
}

public struct Post: Identifiable, Codable, Equatable {
    public let id: UUID
    public let author: User
    public let timestamp: Date
    public let type: FeedItemType
    public let content: String     
    public let imageURL: URL?
    public let videoURL: URL?

}

