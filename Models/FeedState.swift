//
//  FeedState.swift
//  SocialFeedApp
//
//

import Foundation

public enum FeedState: Equatable {
    case idle
    case loading
    case refreshing
    case loadingMore
    case error(Error)
    case empty

    public static func == (lhs: FeedState, rhs: FeedState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle),
             (.loading, .loading),
             (.refreshing, .refreshing),
             (.loadingMore, .loadingMore),
             (.empty, .empty):
            return true
        case (.error, .error):
            return true
        default:
            return false
        }
    }
}

