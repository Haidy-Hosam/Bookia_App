# Bookia App

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

Bookia App is a beautifully designed, scalable, and professional e-commerce application built with Flutter. It embraces Clean Architecture to ensure separation of concerns, high maintainability, and testability.

## 🚀 Project Overview

The primary focus of this repository is to demonstrate a production-ready Flutter codebase. The project is strictly organized to maintain long-term scalability and an excellent developer experience.

## 🏗 Architecture

The app follows the **Clean Architecture** principles and **Feature-First** structure.

### Folder Structure

```
lib/
├── Core/
│   ├── Common Widgets/  # Reusable app-wide UI components
│   ├── Constants/       # App-wide constants (images, fonts, strings)
│   ├── Functions/       # Helper extensions and functions
│   ├── Services/        # Third-party services (Dio, LocalStorage, etc.)
│   ├── Styles/          # Themes, Colors, TextStyles
│   └── routes/          # Navigation and routing setup (go_router)
├── Features/
│   ├── Home/            # Home screen, Banner, Best Sellers
│   ├── Splash_Screen/   # Splash screen
│   ├── Welcome_Screen/  # Welcome/Onboarding screen
│   └── authentication/  # Login, Register, Forgot Password, OTP
│       ├── data/
│       └── presentation/
└── main.dart            # App entry point
```

## 🛠 Technologies & Packages

- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Routing**: [go_router](https://pub.dev/packages/go_router)
- **Network Interface**: [dio](https://pub.dev/packages/dio)
- **SVG Rendering**: [flutter_svg](https://pub.dev/packages/flutter_svg)
- **Animations**: [lottie](https://pub.dev/packages/lottie)
- **UI Responsiveness**: [device_preview](https://pub.dev/packages/device_preview)

## 📸 Screenshots

*(Replace with actual screenshots)*

| Welcome Screen | Login Screen | Home Screen |
| :---: | :---: | :---: |
| <img src="https://via.placeholder.com/200x400.png?text=Welcome" width="200" /> | <img src="https://via.placeholder.com/200x400.png?text=Login" width="200" /> | <img src="https://via.placeholder.com/200x400.png?text=Home" width="200" /> |

## ⚙️ Getting Started

### Prerequisites

Ensure you have the following installed:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version `^3.10.4` or higher)
- [Dart SDK](https://dart.dev/get-dart)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/bookia_app.git
   ```
2. Navigate into the directory:
   ```bash
   cd bookia_app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the project

Run the application on a connected device or emulator:
```bash
flutter run
```

## 🔍 Code Quality Practices

- Strict Linting enabled via `analysis_options.yaml`.
- Immutable state objects and consistent naming conventions.
- Segregated data models and presentation layers.
- Responsive design tailored for multiple device sizes.

## 📈 Future Scalability

The **Feature-First** structure ensures that as the app grows, modules can easily be isolated, modified, or extended without creating tight coupling across the system. It naturally supports breaking into micro-packages if needed in the future.

## 📜 License

This project is open-source and available under the [MIT License](LICENSE).

---
*Built with Haidy❤️ using Flutter.*
