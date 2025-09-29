# Study Planner App

A simple Study Planner app built with Flutter. It provides task management, a calendar view, basic reminder simulation, and local persistence using SharedPreferences.

## What Was Implemented

- Today screen showing tasks due today, with a Floating Action Button to add tasks
- Task creation form with title, optional description, due date picker, and optional reminder time
- Task list UI with completion toggle and delete actions
- Calendar screen with a monthly grid, date selection, and highlighted dates that have tasks
- Settings screen with a reminder toggle (simulated via SnackBar) and storage method info
- Local storage using SharedPreferences with JSON serialization for tasks
- Bottom navigation between Today, Calendar, and Settings

## Project Structure

```
lib/
  main.dart                    # App entry + bottom navigation
  models/
    task.dart                  # Task model + JSON serialization
  services/
    storage_service.dart       # SharedPreferences CRUD for tasks
  screens/
    today_screen.dart          # Today's tasks + add form
    calendar_screen.dart       # Monthly calendar + date filtering
    settings_screen.dart       # Reminder toggle + app/storage info
  widgets/
    task_card.dart             # Task list item UI
    task_form.dart             # Bottom sheet form to create tasks
```

## Key Dependencies

```yaml
shared_preferences: ^2.2.2
intl: ^0.19.0
cupertino_icons: ^1.0.8
```

## How to Run

1) Prerequisites
- Install Flutter SDK and set up an editor (Android Studio/VS Code)
- Run: `flutter doctor` and resolve any issues

2) Get dependencies
```
flutter pub get
```

3) Run on a target platform

- Android (emulator/device):
```
flutter run -d android
```

- iOS (simulator/device, macOS only):
```
flutter run -d ios
```

- Windows desktop:
```
flutter doctor --verbose
```
Ensure Visual Studio (not VS Code) with “Desktop development with C++” workload is installed, then:
```
flutter run -d windows
```

If you see “Unable to find suitable Visual Studio toolchain”, install Visual Studio Community with the C++ desktop workload and re-run `flutter doctor` until it reports no Windows toolchain issues.

## Usage Walkthrough

- Open the app → Today screen shows today’s tasks (empty state initially)
- Tap the + button → Fill in title, optional description, pick a due date and optional reminder time, save
- Toggle a task’s checkbox to mark complete; tap the trash icon to delete
- Go to Calendar → Change months with chevrons, tap a day to see tasks for that date (dots indicate days with tasks)
- Go to Settings → Toggle “Enable reminders (simulation)” to see a SnackBar; view storage method and app version

## Data Persistence

- Tasks are stored locally in SharedPreferences under a single JSON list key
- Model: `Task` includes id, title, optional description, dueDate, optional reminderTime, isCompleted, createdAt

## Known Limitations / Improvements

- Reminders: Only a UI toggle + SnackBar simulation; integrate real local notifications (e.g., flutter_local_notifications) with scheduling
- Editing: No in-place task editing; add edit capability from Today/Calendar lists
- Filtering/Sorting: Add filters (completed/pending), search, and sort options
- Calendar UX: Add weekday headers, week numbers, better out-of-month day styling
- State Management: Consider Provider/Riverpod/Bloc for clearer separation and testability
- Validation/UX: More robust form validation, error states, and loading indicators
- Theming: Expand light/dark themes and typography
- Tests: Add widget and unit tests for storage and date logic

## Build & Release (Android)

```
flutter build apk
```
The generated APK will be under `build/app/outputs/flutter-apk/`.

## Troubleshooting

- Windows toolchain error: Install Visual Studio Community with Desktop C++ workload and ensure `flutter doctor` reports no errors
- Emulator not detected: Start an Android emulator in Android Studio, or connect a device with USB debugging enabled
- Stale state: Try `flutter clean && flutter pub get`

---
