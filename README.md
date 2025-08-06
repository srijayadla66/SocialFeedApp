# SocialFeedApp

A Twitter-like social media feed app built using MVVM + Combine architecture without any third-party libraries.

## 📱 Features

- ✅ **Feed Functionality**
  - Infinite scrolling and pull-to-refresh
  - Post types: Text, Image, Video (mocked)
- ✅ **Real-Time Updates**
  - Simulates live updates with mock real-time service
  - New posts banner when new content arrives
- ✅ **Offline Support**
  - Simple caching using UserDefaults
- ✅ **Plugin System**
  - Factory pattern for adding new post types
  - Extensible and modular UI components
- ✅ **Architecture**
  - MVVM + Combine
  - Fully testable ViewModels
  - Protocol-oriented services (network/cache/real-time)

## 🔧 Technologies Used

- SwiftUI
- Combine
- Foundation
- No third-party dependencies

## 📂 Project Structure Highlights

- `Models/`: Post, User, FeedState
- `ViewModels/`: FeedViewModel
- `Services/`: MockNetworkService, CacheService, RealTimeService
- `Views/`: FeedView, FeedItemCell, PostTypes
- `Plugin System/`: FeedItemRegistry, View Factories

## 🧪 Testing

- Unit Tests: ViewModel, Services, Plugin System
- UI Tests: Feed rendering and interactions

## 📸 Screenshots

- 📰 Feed View with mixed post types
- 🔄 Real-time update banner
- ❌ Offline/empty/error states

## 🚀 Run Instructions

1. Open in Xcode 16+
2. Run on iOS Simulator
3. Mock data loads automatically

## 📜 License

MIT
