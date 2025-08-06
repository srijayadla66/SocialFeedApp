//
//  NetworkError.swift
//  SocialFeedApp
//
//

import Foundation

public enum NetworkError: Error, LocalizedError {
    case serverError(description: String)
    case decodingFailed
    case unknown

    public var errorDescription: String? {
        switch self {
        case .serverError(let desc):
            return "Server error: \(desc)"
        case .decodingFailed:
            return "Failed to decode response"
        case .unknown:
            return "An unknown networking error occurred"
        }
    }
}
