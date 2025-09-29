# Technical Overview

This document explains the key technical choices and building blocks used in the Study Planner app: architecture, widgets, navigation, state handling, persistence, and design considerations.

## Architecture & Folder Structure

- `lib/main.dart`: App entry, theme, and bottom navigation shell (`HomeScaffold`).
- `lib/models/`: Domain models (currently `Task`).
- `lib/services/`: App services (currently local persistence via `StorageService`).
- `lib/screens/`: Feature screens (`Today`, `Calendar`, `Settings`).
- `lib/widgets/`: Reusable UI components (`TaskCard`, `TaskForm`).

This is a small-scale feature-first structure with clear separation of concerns: UI (screens/widgets), domain (models), and infrastructure (services).

## Navigation Shell

- `HomeScaffold` uses Material 3 `NavigationBar` with 3 tabs:
  - Today (index 0)
  - Calendar (index 1)
  - Settings (index 2)
- The selected index controls which screen is displayed. This keeps navigation logic minimal and stateful within the shell.

## Core Widgets & Screens

### TodayScreen
- Purpose: Show tasks due today and provide quick creation/editing.
- Components:
  - `FloatingActionButton` opens `TaskForm` in a bottom sheet.
  - `ListView.builder` renders today’s tasks using `TaskCard`.
  - `Dismissible` enables swipe-to-delete with confirmation.
  - Completion toggle updates `isCompleted` via `StorageService`.

### CalendarScreen
- Purpose: Provide monthly overview and per-day task listing.
- Components:
  - Custom monthly grid built with `GridView.builder`.
  - Dot indicator for days with at least one task.
  - Selected date is tracked locally; tasks filtered for that date.
  - Each list item includes edit/delete actions; edit opens prefilled `TaskForm`.

### SettingsScreen
- Purpose: App options and metadata.
- Components:
  - `SwitchListTile` toggles a reminders setting persisted with `SharedPreferences`.
  - Shows storage method and app version.
  - Reminder toggle triggers a SnackBar (simulation only).

### Reusable Widgets
- `TaskCard`
  - Presents a `Task` in a `ListTile` inside a `Card`.
  - Exposes callbacks: `onEdit`, `onToggleComplete`, `onDelete`.
- `TaskForm`
  - Bottom-sheet form for creation and editing.
  - Fields: title (required), description (optional), due date (required), reminder time (optional).
  - Supports initial values and custom submit label to enable editing.

## Data Model

```dart
class Task {
  final String id;
  final String title;
  final String? description;
  final DateTime dueDate;
  final TimeOfDay? reminderTime;
  final bool isCompleted;
  final DateTime createdAt;
}
```

- Immutable pattern with `copyWith` for updates.
- JSON serialization stores `TimeOfDay` as hour/minute.

## Persistence Layer

- `StorageService` uses `SharedPreferences` with a single key storing a JSON array of tasks.
- Methods: `loadTasks`, `saveTasks`, `addTask`, `updateTask`, `deleteTask`.
- Rationale: Lightweight storage adequate for the assignment; no external DB needed.

## State Handling Strategy

- Local state via `StatefulWidget` in each screen.
- On every CRUD operation, screens call `StorageService` and then refresh by reloading tasks.
- Rationale: Keeps logic simple for a small app; easy to replace with Provider/Riverpod/Bloc later.

## UI/UX Notes

- Material 3 theme via `ColorScheme.fromSeed` and `useMaterial3: true`.
- Bottom sheets for task creation/editing to keep context and reduce navigation complexity.
- Confirmation dialogs for deletions to prevent accidental data loss.
- Empty states are shown clearly (e.g., no tasks for today/selected date).

## Error Handling & Validation

- `TaskForm` validates required title and requires a due date before submission.
- Storage decode errors fall back to empty list to keep the app usable.
- Basic try/catch in persistence; can be extended with logging/reporting as needed.

## Extensibility Considerations

- Replace `SharedPreferences` with a repository interface to support Hive/SQLite or remote APIs.
- Introduce state management (Provider/Riverpod/Bloc) to centralize app state and reduce reload calls.
- Add editing flows from Calendar and Today (already supported) and expand to a detail screen if needed.
- Integrate real local notifications (`flutter_local_notifications`) using scheduled notifications from `reminderTime`.
- Add filters/sorting, search, and bulk actions.
- Add tests: unit tests for `StorageService` and widget tests for screens.

## Platform Notes

- Windows desktop requires Visual Studio with the Desktop C++ workload (see README run instructions).
- Android/iOS require standard Flutter setup; persistence works cross‑platform since it uses `SharedPreferences`.

---

This overview covers the main technical choices and how the app is composed. For quick start, folder map, and feature list, see `README.md`. For change-by-change details, see `IMPLEMENTATION_OVERVIEW.md`.
