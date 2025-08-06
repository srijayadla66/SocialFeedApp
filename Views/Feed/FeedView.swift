import SwiftUI
import Combine

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()
    @State private var showNewPostsBanner = false

    var body: some View {
        NavigationView {
            ZStack {
                // 1) Loading state
                if viewModel.state == .loading {
                    LoadingView()

                // 2) Error state
                } else if case .error(let error) = viewModel.state {
                    ErrorView(error: error) {
                        viewModel.loadInitial()
                    }

                // 3) Empty-state
                } else if viewModel.posts.isEmpty {
                    EmptyStateView(message: "No posts yet!")

                // 4) Showing the list
                } else {
                    List {
                        // Banner for real-time posts
                        if showNewPostsBanner {
                            NewPostsBanner {
                                withAnimation {
                                    showNewPostsBanner = false
                                }
                                viewModel.refresh()
                            }
                        }

                        // Feed items + infinite scroll trigger
                        ForEach(viewModel.posts) { post in
                            FeedItemCell(post: post)
                                .onAppear {
                                    if post == viewModel.posts.last {
                                        viewModel.loadMore()
                                    }
                                }
                        }
                    }
                    .refreshable {
                        viewModel.refresh()
                    }
                }
            }
            .navigationTitle("Social Feed")

            // Trigger initial load & real-time subscription
            .onAppear {
                viewModel.loadInitial()
                viewModel.startRealTime()
            }
            // Show banner whenever `posts` changes after first load
            .onReceive(viewModel.$posts.dropFirst()) { _ in
                showNewPostsBanner = true
            }
            // Cleanup on disappear
            .onDisappear {
                viewModel.stopRealTime()
            }
        }
    }
}
