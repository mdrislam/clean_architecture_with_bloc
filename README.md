# GitHub Repository Explorer

A Flutter application that explores GitHub repositories with clean architecture, offline support, and pagination. The app allows users to search for repositories, view details, and works offline with cached data.

## Features

- 🔍 Search GitHub repositories by name
- ⭐ Sort repositories by stars in descending order
- 📱 Pagination with infinite scroll
- 📦 Offline caching support
- 🌓 Dark/light mode toggle
- 🔍 Repository details view
- 🚦 Error handling with retry
- 🔄 Pull-to-refresh functionality
- 💫 Shimmer loading effects

## Screenshots

|               | Light Mode                          | Dark Mode                           |
|---------------|-------------------------------------|-------------------------------------|
| **Home Screen** | ![Home Light](https://raw.githubusercontent.com/mdrislam/tikweb_-task/main/assets_sc/home_light.jpeg) | ![Home Dark](https://raw.githubusercontent.com/mdrislam/tikweb_-task/main/assets_sc/home_dark.jpeg) |
| **Detail Screen** | ![Detail Light](https://raw.githubusercontent.com/mdrislam/tikweb_-task/main/assets_sc/d_light.jpeg) | ![Detail Dark](https://raw.githubusercontent.com/mdrislam/tikweb_-task/main/assets_sc/d_dark.jpeg) |

## Demo Video

[![App Demo](https://raw.githubusercontent.com/mdrislam/tikweb_-task/main/assets_sc/d_light.jpeg)](https://github.com/mdrislam/tikweb_-task/blob/main/assets_sc/demo.mp4)

Click the image above to watch the full app demo

## Architecture

The app follows Clean Architecture with three main layers:
lib/
├── core/ # Framework-agnostic core (constants, errors, utils)
│ ├── constants/
│ ├── errors/
│ ├── network/
│ ├── theme/
│ └── utils/
├── features/
│ └── repo_explorer/
│ ├── data/
│ │ ├── datasources/
│ │ ├── models/
│ │ └── repositories/
│ ├── domain/
│ │ ├── entities/
│ │ ├── repositories/
│ │ └── usecases/
│ └── presentation/
│ ├── bloc/
│ │ ├── repo_bloc.dart
│ │ ├── repo_event.dart
│ │ └── repo_state.dart
│ ├── pages/
│ └── widgets/
├── injection_container.dart
└── main.dart

text

### Key Components
- **BLoC**: State management using flutter_bloc
- **Repository Pattern**: Abstract data layer implementation
- **SOLID Principles**: Applied throughout the codebase
- **Dependency Injection**: Manual dependency management

## Setup Instructions

### Prerequisites
- Flutter SDK (>= 3.0.0)
- Dart SDK (>= 2.17.0)

### Installation
1. Clone the repository:
```bash
git clone https://github.com/mdrislam/tikweb_-task.git
Install dependencies:

bash
cd tikweb_-task
flutter pub get
Run the app:

bash
flutter run
Building for Production
bash
# For Android
flutter build apk --release

# For iOS
flutter build ios --release
Technical Implementation
Key Packages
Package	Purpose
flutter_bloc	State management
http	API requests
shared_preferences	Local caching
url_launcher	Opening URLs
shimmer	Loading animations
API Integration
Uses GitHub's search API:

text
GET /search/repositories?q={query}+in:name&sort=stars&order=desc&page={page}&per_page=20
Offline Support
Caches API responses using SharedPreferences

Shows cached data when offline with visual indicator

Automatic fallback to cached data on network errors

Pagination
Implements infinite scroll

Loads 20 items per page

Automatic loading when scrolling to bottom

Assumptions & Limitations
Assumptions
Default search query is "flutter"

Only first page is cached for offline use

GitHub API rate limits (60 requests/hour) are sufficient for demo

No authentication required for basic search functionality

Limitations
Caching only applies to first page results

Pagination limited to 1000 results by GitHub API

No user authentication for higher rate limits

Simple caching strategy without expiration

Testing
Unit Tests
Run all unit tests:

bash
flutter test
Test coverage includes:

BLoC state transitions

Repository logic

Data source implementations

Use case validation

Widget Tests
Key widget tests:

Home screen states (loading, success, error)

List item rendering

Detail screen display

Theme switching functionality

Bonus Features Implemented
✅ Pull-to-refresh

✅ Unit tests for BLoC and repositories

✅ Shimmer loading effects

✅ Dynamic theme switching

✅ Modular folder structure

✅ Custom page transitions

Future Improvements
Implement proper cache expiration policy

Add user authentication for higher API limits

Include repository bookmarking feature

Add more sorting options (forks, updated date)

Implement localization for multiple languages

Add integration tests

Contributing
Contributions are welcome! Please follow these steps:

Fork the repository

Create your feature branch (git checkout -b feature/AmazingFeature)

Commit your changes (git commit -m 'Add some AmazingFeature')

Push to the branch (git push origin feature/AmazingFeature)

Open a pull request

License
Distributed under the MIT License. See LICENSE for more information.

Contact
Md. Rasel Islam - @mdrrasel404 - rasel.cse.kuet@gmail.com

Project Link: https://github.com/mdrislam/tikweb_-task