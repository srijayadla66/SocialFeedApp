//
//  FeedViewModel.swift
//  SocialFeedApp
//
//
import Foundation
import Combine

final class FeedViewModel: ObservableObject {
    // Inputs
    private let network: NetworkServiceProtocol
    private let cache: CacheServiceProtocol
    private let realtime: RealTimeServiceProtocol

    // Outputs
    @Published private(set) var posts: [Post] = []
    @Published private(set) var state: FeedState = .idle

    private var cancellables = Set<AnyCancellable>()

    init(network: NetworkServiceProtocol = MockNetworkService(),
         cache: CacheServiceProtocol = CacheService(),
         realtime: RealTimeServiceProtocol = MockRealTimeService()) {
        self.network = network
        self.cache = cache
        self.realtime = realtime

        // Load cached first
        let cached = cache.loadCachedPosts()
        if !cached.isEmpty {
            posts = cached
        }

        // Subscribe to real-time
        realtime.newPostPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newPost in
                self?.posts.insert(newPost, at: 0)
            }
            .store(in: &cancellables)
    }

    func loadInitial() {
        state = .loading
        network.fetchInitialPosts()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.state = .error(error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] posts in
                self?.posts = posts
                self?.cache.savePosts(posts)
                self?.state = posts.isEmpty ? .empty : .idle
            }
            .store(in: &cancellables)
    }

    func refresh() {
        guard let first = posts.first else { return }
        state = .refreshing
        network.fetchNewerPosts(after: first.timestamp)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.state = .idle
            } receiveValue: { [weak self] newPosts in
                self?.posts.insert(contentsOf: newPosts, at: 0)
            }
            .store(in: &cancellables)
    }

    func loadMore() {
        guard let last = posts.last else { return }
        state = .loadingMore
        network.fetchOlderPosts(before: last.timestamp)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.state = .idle
            } receiveValue: { [weak self] older in
                self?.posts.append(contentsOf: older)
            }
            .store(in: &cancellables)
    }

    func startRealTime() {
        realtime.start()
    }

    func stopRealTime() {
        realtime.stop()
    }
}

