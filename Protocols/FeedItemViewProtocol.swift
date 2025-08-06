//
//  FeedItemViewProtocol.swift
//  SocialFeedApp
//
//  Created by Namburi Rammohanrao on 8/6/25.
//

import SwiftUI

public protocol FeedItemViewProtocol {
    static var itemType: FeedItemType { get }
    init(post: Post)
    func makeView() -> AnyView
}
