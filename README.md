# Flutter Product Detail App

A modern, feature-rich Flutter application showcasing a complete product detail page with clean architecture, responsive design, and best practices implementation.



📱 Features

### Core Functionality
- **Product Display**: High-quality product images with responsive design
- **Product Variations**: Interactive color and size selection with thumbnail previews
- **Detailed Specifications**: Material composition, origin, and size guide
- **Delivery Options**: Multiple shipping methods with pricing
- **Customer Reviews**: Star ratings with user feedback and profile images
- **Shopping Cart**: Add to cart functionality with quantity management
- **Favorites**: Save products to favorites with persistent storage
- **Product Recommendations**: Curated product suggestions

### Technical Features
- **Clean Architecture**: Separation of concerns with organized layers
- **State Management**: Provider pattern for reactive UI updates
- **Mock Services**: Complete mock data layer for development and testing
- **Responsive Design**: Adaptive layouts for different screen sizes
- **Custom Theming**: Centralized design system with Google Fonts
- **Modular Widgets**: Reusable components with base classes

## 🏗️ Architecture

The app follows a clean, layered architecture promoting maintainability and testability:

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── product.dart         # Product and ProductSpecifications
│   ├── reviews.dart         # Customer review model
│   └── variataions.dart     # Product variation model
├── pages/                    # Screen-level widgets
│   └── product_page.dart    # Main product detail page
├── providers/                # Dependency injection
│   └── app_providers.dart   # Provider configuration
├── services/                 # Business logic layer
│   ├── cart_service.dart           # Cart interface
│   ├── favorites_service.dart      # Favorites interface
│   ├── product_repository.dart     # Product data interface
│   ├── mock_cart_service.dart      # Cart mock implementation
│   ├── mock_favorites_service.dart # Favorites mock implementation
│   └── mock_product_repository.dart# Product data mock implementation
├── theme/                    # Design system
│   └── app_theme.dart       # Colors, typography, spacing
└── widgets/                  # Reusable UI components
    ├── base/                # Abstract base widgets
    │   ├── base_card.dart
    │   └── base_product_section.dart
    └── [various widgets]    # Specific UI components
```

### Design Patterns Used
- **Repository Pattern**: Abstract data access with mock implementations
- **Provider Pattern**: Dependency injection and state management
- **Template Method Pattern**: Base widgets with customizable content
- **Composition over Inheritance**: Modular widget architecture

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- VS Code or Android Studio
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/andreswooshik/Full-Product-Page.git
   cd Full-Product-Page/product_detail_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

4. **Choose your target platform**
   - Press `1` for Windows (desktop)
   - Press `2` for Chrome (web)
   - Press `3` for Edge (web)

### Development Commands

```bash
# Hot reload (during development)
r

# Hot restart
R

# Clear console
c

# Quit application
q

# Run tests
flutter test

# Build for production
flutter build web          # Web build
flutter build windows      # Windows build
```

## 📦 Dependencies

### Main Dependencies
- **flutter**: Flutter SDK
- **provider** (^6.0.5): State management and dependency injection
- **google_fonts** (^6.1.0): Typography with Raleway and Nunito Sans fonts
- **cupertino_icons** (^1.0.6): iOS-style icons

### Dev Dependencies
- **flutter_test**: Testing framework
- **flutter_lints** (^3.0.0): Code analysis and linting

## 🎨 Design System

### Color Palette
- **Primary Blue**: `#007AFF` - Action buttons and accents
- **Primary Black**: `#000000` - Text and cart buttons
- **Background**: `#FFFFFF` - Clean, minimal background
- **Cards**: `#FFFFFF` - Elevated surfaces with shadows
- **Borders**: `Colors.grey` - Subtle boundaries

### Typography
- **Titles**: Raleway (weights: 600, 800)
- **Body Text**: Nunito Sans (weight: 400)
- **Responsive sizing**: 14px-24px range

### Spacing
- **Small**: 8px
- **Medium**: 12px  
- **Large**: 20px
- **Extra Large**: 40px

## 🧪 Testing

The application includes comprehensive mock services for testing:

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/widget_test.dart
```

### Mock Data
- **Products**: Sample clothing items with complete specifications
- **Reviews**: Customer feedback with ratings and timestamps  
- **Variations**: Color and size options with images
- **Cart/Favorites**: In-memory storage with realistic delays

## 📱 Screenshots

### Product Page Features
- **Hero Image**: Large, responsive product display
- **Variations**: Interactive color/size selection
- **Specifications**: Material details and origin
- **Reviews**: Customer ratings and feedback
- **Delivery**: Shipping options with pricing
- **Actions**: Add to cart, favorites, buy now

### Responsive Design
- **Mobile**: Optimized for phone screens
- **Tablet**: Adapted layouts for larger screens  
- **Desktop**: Enhanced spacing and layouts
- **Web**: Browser-compatible with smooth scrolling

## 🔧 Configuration

### Theme Customization
Edit `lib/theme/app_theme.dart` to customize:
- Colors and brand palette
- Typography and font families
- Spacing and sizing constants
- Button and card styles

### Mock Data
Modify `lib/services/mock_product_repository.dart` to:
- Add new products
- Update product information
- Change pricing and descriptions
- Add more customer reviews

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style
- Follow Dart/Flutter conventions
- Use meaningful variable names
- Add comments for complex logic
- Maintain consistent formatting
- Write tests for new features

## 📄 License

This project is created for educational purposes. Feel free to use it as a reference or starting point for your own projects.

## 👨‍💻 Author

**andreswooshik**
- GitHub: [@andreswooshik](https://github.com/andreswooshik)
- Project: [Full-Product-Page](https://github.com/andreswooshik/Full-Product-Page)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Google Fonts for beautiful typography
- Provider package maintainers
- Material Design guidelines
- Flutter community for inspiration and support

---

**Academic Note**: This project was developed for SP Elect 1B Prelim Exam, demonstrating clean architecture principles and Flutter best practices.

Made with ❤️ using Flutter
