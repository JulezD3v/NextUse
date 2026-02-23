# NextUse

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

## Color Palette
class AppColors {
  * static const background = Color(0xFFE8E3CF);
  * static const container = Color(0xFFF4F1E4);
  * static const tabUnselected = Color(0xFFE2DCC7);
  * static const tabSelected = Color(0xFFF4F1E4);
  * static const border = Color(0xFFB8AE8A);
  * static const textPrimary = Color(0xFF5C563E);
  * static const accent = Color(0xFF8E9A5B);
}
## HomePage layout
lib/
├── core/
│   ├── constants/
│   │   └── app_colors.dart      # move from README + expand
│   ├── theme/
│   │   └── app_theme.dart
│   └── utils/
│       └── responsive.dart      # breakpoints helper
├── features/
│   ├── home/
│   │   ├── bloc/
│   │   │   ├── home_bloc.dart
│   │   │   ├── home_event.dart
│   │   │   └── home_state.dart
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── highlight.dart
│   │   │   └── repositories/
│   │   │       └── home_repository.dart   # + mock
│   │   └── presentation/
│   │       └── pages/
│   │           └── home_page.dart
│   ├── inventory/
│   └── pickup/
├── shared/
│   └── widgets/
│       ├── quick_action_button.dart
│       └── waste_category_card.dart
└── main.dart
