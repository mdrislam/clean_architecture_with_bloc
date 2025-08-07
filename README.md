# GitHub Repository Explorer

A **Flutter application** for exploring GitHub repositories with a clean architecture, offline support, and pagination. It enables users to search for repositories, view detailed information, and access cached data offline.

---

## 🧭 Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Demo Video](#demo-video)
- [Architecture](#architecture)
- [Setup Instructions](#setup-instructions)
- [Technical Implementation](#technical-implementation)
- [Assumptions & Limitations](#assumptions--limitations)
- [Testing](#testing)
- [Bonus Features Implemented](#bonus-features-implemented)
- [Contact](#contact)

---

## ✨ Features

- 🔍 Search GitHub repositories by name  
- ⭐ Sort repositories by stars in descending order  
- 📱 Pagination with infinite scroll  
- 📦 Offline caching support  
- 🌓 Dark/light mode toggle  
- 📄 Repository details view  
- 🚦 Error handling with retry  
- 🔄 Pull-to-refresh functionality  
- 💫 Shimmer loading effects  

---

## 📸 Screenshots

|               | Light Mode                          | Dark Mode                           |
|---------------|-------------------------------------|-------------------------------------|
| **Home Screen** | ![Home Light](https://raw.githubusercontent.com/mdrislam/tikweb_-task/main/assets_sc/home_light.jpeg) | ![Home Dark](https://raw.githubusercontent.com/mdrislam/tikweb_-task/main/assets_sc/home_dark.jpeg) |
| **Detail Screen** | ![Detail Light](https://raw.githubusercontent.com/mdrislam/tikweb_-task/main/assets_sc/d_light.jpeg) | ![Detail Dark](https://raw.githubusercontent.com/mdrislam/tikweb_-task/main/assets_sc/d_dark.jpeg) |

---

## 🎥 Demo Video

[Click here to watch the full app demo](https://github.com/mdrislam/tikweb_-task/blob/main/assets_sc/demo.mp4)


## 📂 Project Structure

```plaintext
lib/
├── core/                      # Framework-agnostic utilities & constants
│   ├── constants/             # App-wide constants (e.g., strings, URLs)
│   ├── errors/                # Error models and handlers
│   ├── network/               # Network configuration and interceptors
│   ├── theme/                 # Light/dark theme definitions
│   └── utils/                 # Common utility/helper functions
│
├── features/
│   └── repo_explorer/         # Feature: GitHub Repository Explorer
│       ├── data/              # Data layer (models, datasources, repositories)
│       │   ├── datasources/   # API/local data access implementations
│       │   ├── models/        # DTOs and response models
│       │   └── repositories/  # Repository implementations
│       │
│       ├── domain/            # Domain layer (entities, usecases, abstractions)
│       │   ├── entities/      # Core business objects (e.g., RepoEntity)
│       │   ├── repositories/  # Repository interfaces (abstract classes)
│       │   └── usecases/      # Business logic and application rules
│       │
│       └── presentation/      # UI layer
│           ├── bloc/          # State management using BLoC pattern
│           ├── pages/         # Screens/pages (e.g., home, detail)
│           └── widgets/       # Reusable UI components
│
├── injection_container.dart   # Service locator for dependency injection
└── main.dart                  # Application entry point

## 📌 Key Components

- **BLoC**: State management using `flutter_bloc`
- **Repository Pattern**: Abstracted data layer implementation
- **SOLID Principles**: Applied consistently across codebase
- **Dependency Injection**: Manual dependency setup via service locator

---

🧪 Testing
Unit tests for domain use cases and repository implementations

Widget tests for key UI components like HomeScreen and RepoListItem

Mocking via Mockito and generated mock files for API data source

Tests cover successful data fetch, pagination, error scenarios, and loading states

🎁 Bonus Features Implemented
Shimmer loading animation for a smooth loading experience

Pull-to-refresh to reload repository list

Dark/light mode toggle supporting user preference

Dependency injection manually structured for easy scalability

Clear separation of concerns following SOLID principles

🚀 Future Improvements
Add authentication support for increased API rate limits and user-specific data

Improve offline caching with background sync and cache expiration

Add repository README viewer with Markdown rendering

Implement favorites/starred repos with local persistence

Add unit and widget tests coverage for full feature set

Enhance error handling with specific messages for different API errors

Improve UI/UX with animations and accessibility features
---

## ⚙️ Setup Instructions

### ✅ Prerequisites

- Flutter SDK (>= 3.32.8)
- Dart SDK (>= 3.8.1)

### 📦 Installation

```bash
# Clone the repository
git clone https://github.com/mdrislam/tikweb_-task.git

# Navigate to the project directory
cd tikweb_-task

# Install dependencies
flutter pub get

# Run the app
flutter run
How to run your Flutter tests:
Make sure your mock files are generated

Run this command in your project root to generate Mockito mocks:


flutter pub run build_runner build --delete-conflicting-outputs
This will create the *.mocks.dart files needed for your tests.

Run all tests

To run all your tests, including unit and widget tests, run:


flutter test
This will execute tests inside the test/ folder and show you pass/fail results.

Run a specific test file

For example, to run only the usecase test:


flutter test test/features/repo_explorer/domain/usecases/fetch_repo_repository_usecase_test.dart
Or for the widget test:

flutter test test/features/repo_explorer/presentation/pages/home_screen_test.dart

📞 Contact
Project Maintainer: Risad Hossain

Email: mmdrislam@gmail.com

GitHub: https://github.com/mdrislam

LinkedIn: https://www.linkedin.com/in/risadhossain/

