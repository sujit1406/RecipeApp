# Cooking Recipe App

A SwiftUI-based cooking recipe application built with MVVM-C (Model-View-ViewModel-Coordinator) architecture.

## Architecture Overview

This project follows the MVVM-C pattern, which provides:

- **Separation of Concerns**: Clear separation between data, business logic, presentation, and navigation
- **Testability**: Each layer can be tested independently
- **Maintainability**: Easy to modify and extend functionality
- **Scalability**: Structured to handle growing complexity

## Project Structure

```
CookingRecipeApp/
├── Models/                 # Data models
│   ├── Recipe.swift       # Recipe data model
│   ├── User.swift         # User data model
│   └── AppState.swift     # Global application state
├── Services/              # Business logic and data access
│   ├── RecipeService.swift # Recipe data operations
│   └── AuthService.swift  # Authentication operations
├── ViewModels/            # View models for business logic
│   ├── HomeViewModel.swift # Home screen logic
│   └── AuthViewModel.swift # Authentication logic
├── Views/                 # SwiftUI views
│   ├── SplashView.swift   # Splash screen
│   ├── AuthView.swift     # Login/Signup screen
│   ├── MainTabView.swift  # Main tab navigation
│   ├── HomeView.swift     # Home screen
│   ├── ProfileView.swift  # User profile
│   ├── SavedView.swift    # Saved recipes
│   ├── NotificationsView.swift # Notifications
│   └── AddRecipeView.swift # Add new recipe
├── Coordinators/          # Navigation coordination
│   ├── AppCoordinator.swift # Main app flow coordination
│   └── MainCoordinator.swift # Main tab coordination
├── Card/                  # Reusable UI components
│   ├── RecipeCardView.swift
│   ├── CategoryCardView.swift
│   ├── NewRecipeCardView.swift
│   └── SearchBarView.swift
├── Common/                # Shared utilities
│   ├── Colors.swift
│   └── Extensions.swift
└── CookingRecipeAppApp.swift # App entry point
```

## Architecture Components

### Models
- **Recipe**: Represents recipe data with properties like name, ingredients, instructions, etc.
- **User**: Represents user data including authentication information
- **AppState**: Singleton managing global application state (authentication, user data)

### Services
- **RecipeService**: Handles recipe-related operations (fetch, search, save)
- **AuthService**: Manages authentication operations (sign in, sign up, sign out)

### ViewModels
- **HomeViewModel**: Manages home screen data and business logic
- **AuthViewModel**: Handles authentication state and operations

### Coordinators
- **AppCoordinator**: Manages app-level navigation flow (splash → auth → main)
- **MainCoordinator**: Handles navigation within the main app (tabs, modals)

### Views
- **SplashView**: Initial loading screen
- **AuthView**: Combined login/signup interface
- **MainTabView**: Tab-based navigation container
- **HomeView**: Recipe browsing and search
- **ProfileView**: User profile and settings
- **SavedView**: Saved recipes display
- **NotificationsView**: User notifications
- **AddRecipeView**: Recipe creation form

## Key Features

- **Authentication Flow**: Complete sign in/sign up with state management
- **Recipe Browsing**: Grid layout with featured recipes and search
- **Recipe Details**: Detailed view with ingredients and instructions
- **Save/Favorite**: Toggle recipe saving functionality
- **Profile Management**: User profile with stats and settings
- **Notifications**: User notification system
- **Add Recipes**: Form for creating new recipes

## Data Flow

1. **App Launch**: AppCoordinator determines initial flow based on authentication state
2. **Authentication**: AuthViewModel handles login/signup via AuthService
3. **Main App**: MainCoordinator manages tab navigation and modal presentations
4. **Recipe Operations**: HomeViewModel manages recipe data via RecipeService
5. **State Updates**: Changes propagate through ObservableObject publishers

## Benefits of MVVM-C

- **Testability**: Services and ViewModels can be easily unit tested
- **Reusability**: Components can be reused across different views
- **Maintainability**: Clear separation makes code easier to understand and modify
- **Scalability**: Architecture supports adding new features without major refactoring
- **Navigation**: Coordinators provide centralized navigation management

## Getting Started

1. Open the project in Xcode
2. Build and run the application
3. The app will start with a splash screen, then navigate to authentication
4. Use any email/password to sign in (demo mode)
5. Explore the recipe browsing, saving, and profile features

## Future Enhancements

- Real API integration for recipes and authentication
- Image upload for recipes
- Social features (sharing, following)
- Recipe recommendations
- Offline support
- Push notifications 
