# Zara App 🛍️

A modern **Flutter e-commerce application** inspired by the Zara shopping experience.

The project focuses on building a clean and responsive shopping UI with product browsing, product details, cart management, orders, notifications, and a structured Flutter architecture.

## ✨ Features

* 🏠 Home screen
* 🛍️ Product browsing
* 📦 Product details
* 🛒 Shopping cart
* 🔔 Notifications
* 📋 Orders list
* 📦 Order details
* 🚀 Splash screen
* 🎨 Custom fonts and UI assets
* 📱 Flutter-based cross-platform application

## 🛠️ Tech Stack

* **Flutter**
* **Dart**
* Material Design
* SVG assets
* Custom fonts

### Packages

The project currently uses:

* [`flutter_svg`](https://pub.dev/packages/flutter_svg) — SVG rendering
* [`gap`](https://pub.dev/packages/gap) — spacing between widgets
* [`iconsax_flutter`](https://pub.dev/packages/iconsax_flutter) — Iconsax icons
* [`iconsax_plus`](https://pub.dev/packages/iconsax_plus) — Additional Iconsax icons
* [`timeline_tile`](https://pub.dev/packages/timeline_tile) — Timeline UI components

The dependencies and Flutter SDK requirement are defined in `pubspec.yaml`.

## 📁 Project Structure

```text
lib/
├── core/
│   ├── constants/
│   └── styles/
│
├── data/
│   └── models/
│
├── features/
│   ├── Main/
│   ├── home/
│   ├── product_details/
│   ├── shop/
│   └── splash/
│
└── main.dart

Assets/
├── fonts/
├── icons/
└── images/
```

The application entry point is `lib/main.dart`, which initializes the Flutter app and starts with the `SplashScreen`.

## 🚀 Getting Started

### Prerequisites

Make sure you have Flutter installed on your machine.

The project currently requires a Dart SDK compatible with:

```text
^3.13.0
```

as specified in `pubspec.yaml`.

### 1. Clone the repository

```bash
git clone https://github.com/mostafaosama3/zara_app.git
```

### 2. Navigate to the project

```bash
cd zara_app
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the application

Connect a device or start an emulator, then run:

```bash
flutter run
```

## 🎨 Assets & Fonts

The project includes custom assets located inside the `Assets` directory:

```text
Assets/
├── icons/
├── images/
└── fonts/
```

Custom fonts currently included:

* **Gabarito**
* **Circularstd**

These fonts are configured directly in `pubspec.yaml`.

## 🧩 Application Screens
<h2>📸 Screenshots</h2>


<h3>🏠 Home & Discovery</h3>

<p align="center">
  <img src="docs/screenshots/home/home.png" width="200"/>
  <img src="docs/screenshots/home/categories.png" width="200"/>
  <img src="docs/screenshots/home/search.png" width="200"/>
</p>

<h3>🛍️ Products</h3>

<p align="center">
  <img src="docs/screenshots/products/products.png" width="200"/>
  <img src="docs/screenshots/products/product-details.png" width="200"/>
  <img src="docs/screenshots/products/product-options.png" width="200"/>
  <img src="docs/screenshots/products/reviews.png" width="200"/>
</p>

### Splash

Initial screen displayed when launching the application.

### Home

Main shopping interface for browsing the available products.

### Product Details

Displays detailed information about a selected product.

### Shop

Contains shopping-related functionality such as:

* Cart
* Orders
* Order list
* Notifications

### Main App

Provides the main application structure and navigation between the different sections.

## 🏗️ Architecture

The project follows a feature-based structure to keep the application organized and scalable.

```text
lib/
│
├── core/
│   ├── constants/
│   └── styles/
│
├── data/
│   └── models/
│
└── features/
    ├── home/
    ├── product_details/
    ├── shop/
    ├── splash/
    └── Main/
```

This structure separates shared application resources, data models, and feature-specific UI.

## 🧪 Testing

Flutter's testing framework is included as a development dependency.

Run the test suite with:

```bash
flutter test
```

## 📌 Project Status

This project is currently under development.

Future improvements may include:

* Backend/API integration
* Authentication
* Real product data
* Persistent cart
* Payment integration
* Search and filtering
* Improved animations and interactions
* More comprehensive testing

## 👨‍💻 Author

**Mostafa Osama**

GitHub: [@mostafaosama3](https://github.com/mostafaosama3)

## 📄 License

No license is currently specified in the repository.

If you intend to distribute or reuse this project, consider adding an appropriate open-source license.

---

⭐ If you find this project useful, consider giving it a star!


