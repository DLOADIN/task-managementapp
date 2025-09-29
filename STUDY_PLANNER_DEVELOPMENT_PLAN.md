# Study Planner App Development Plan
## Individual Assignment 1 - 2 Hour Sprint

### 📋 **Assignment Overview**
- **Due Date:** Oct 10 by 11:59pm
- **Points:** 30
- **Goal:** Build a Study Planner App with task management, calendar view, reminders, and local storage

---

## 🎯 **Development Strategy (2 Hours Total)**

### **Phase 1: Project Setup & Core Structure (30 minutes)**
- [ ] Clean up current form project and restructure for Study Planner
- [ ] Set up proper folder structure (models, screens, services, utils)
- [ ] Add required dependencies (shared_preferences, intl for date handling)
- [ ] Create Task model class
- [ ] Set up BottomNavigationBar with 3 screens (Today, Calendar, Settings)

### **Phase 2: Task Management Implementation (45 minutes)**
- [ ] Create Task model with title, description, due date, reminder time
- [ ] Build task creation form with date picker and time picker
- [ ] Implement Today screen showing today's tasks
- [ ] Add task validation and error handling
- [ ] Create task list widgets with proper styling

### **Phase 3: Calendar & Navigation (30 minutes)**
- [ ] Build monthly calendar widget with date highlighting
- [ ] Implement date selection and task filtering
- [ ] Add navigation between screens
- [ ] Create task detail view for selected dates
- [ ] Add visual indicators for dates with tasks

### **Phase 4: Local Storage & Persistence (30 minutes)**
- [ ] Implement SharedPreferences for task storage
- [ ] Create JSON serialization for Task objects
- [ ] Add save/load functionality for tasks
- [ ] Test data persistence across app restarts
- [ ] Add storage method indicator in Settings

### **Phase 5: Reminders & Settings (15 minutes)**
- [ ] Implement reminder toggle in Settings
- [ ] Add reminder popup simulation
- [ ] Create Settings screen with storage info
- [ ] Add app information and version details

---

## 🏗️ **Technical Architecture**

### **Folder Structure**
```
lib/
├── main.dart
├── models/
│   └── task.dart
├── screens/
│   ├── today_screen.dart
│   ├── calendar_screen.dart
│   └── settings_screen.dart
├── services/
│   └── storage_service.dart
├── widgets/
│   ├── task_card.dart
│   ├── calendar_widget.dart
│   └── task_form.dart
└── utils/
    └── date_utils.dart
```

### **Key Dependencies**
```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.2.2
  intl: ^0.19.0
  cupertino_icons: ^1.0.8
```

---

## 📱 **Screen Specifications**

### **1. Today Screen**
- Header: "Today's Tasks" with current date
- List of tasks due today
- Empty state when no tasks
- Add task floating action button
- Task cards with title, description, reminder time

### **2. Calendar Screen**
- Monthly calendar grid
- Highlighted dates with tasks
- Date selection functionality
- Task list for selected date
- Navigation between months

### **3. Settings Screen**
- Reminder toggle switch
- Storage method indicator
- App version information
- Clear data option (bonus)

---

## 🎨 **UI/UX Requirements**

### **Material Design Compliance**
- Use Scaffold, AppBar, ListTile consistently
- Follow Material Design color scheme
- Implement proper spacing and typography
- Add loading states and error handling

### **Responsive Design**
- Support both portrait and landscape
- Proper keyboard handling
- Accessible touch targets
- Smooth animations and transitions

---

## 💾 **Data Management**

### **Task Model Structure**
```dart
class Task {
  String id;
  String title;
  String? description;
  DateTime dueDate;
  TimeOfDay? reminderTime;
  bool isCompleted;
  DateTime createdAt;
}
```

### **Storage Implementation**
- Use SharedPreferences for simplicity
- Store tasks as JSON array
- Implement CRUD operations
- Add data validation and error handling

---

## 🚀 **Development Steps (Detailed)**

### **Step 1: Project Cleanup & Setup (15 min)**
1. Remove current form code
2. Create new folder structure
3. Update pubspec.yaml with dependencies
4. Set up main.dart with BottomNavigationBar

### **Step 2: Task Model & Storage (15 min)**
1. Create Task model with all required fields
2. Implement JSON serialization
3. Create StorageService for CRUD operations
4. Add data validation methods

### **Step 3: Today Screen (20 min)**
1. Build task list UI with ListView
2. Add floating action button for new tasks
3. Implement task creation form
4. Add date and time pickers
5. Connect to storage service

### **Step 4: Calendar Screen (20 min)**
1. Create monthly calendar widget
2. Add date highlighting for tasks
3. Implement date selection
4. Show tasks for selected date
5. Add month navigation

### **Step 5: Settings & Reminders (10 min)**
1. Create settings screen
2. Add reminder toggle
3. Show storage method info
4. Implement reminder popup simulation

### **Step 6: Testing & Polish (10 min)**
1. Test all functionality
2. Verify data persistence
3. Check UI responsiveness
4. Add final touches and error handling

---

## 📝 **Demo Video Script Outline**

### **Introduction (2 min)**
- App overview and purpose
- Show all three main screens
- Demonstrate navigation

### **Task Management (3 min)**
- Create a new task
- Show task details and validation
- Demonstrate today's tasks view
- Show task persistence

### **Calendar Features (2 min)**
- Navigate calendar months
- Show highlighted dates
- Select dates and view tasks
- Demonstrate date-task linking

### **Settings & Storage (2 min)**
- Show settings screen
- Toggle reminders
- Display storage information
- Test data persistence

### **Code Walkthrough (3 min)**
- Explain folder structure
- Show key model classes
- Demonstrate storage implementation
- Highlight Material Design usage

---

## ✅ **Success Criteria Checklist**

### **Core Features (5 pts)**
- [ ] Task creation with title, description, due date, reminder
- [ ] Today's tasks display
- [ ] Calendar view with task highlighting
- [ ] Date selection and task filtering
- [ ] Reminder popup simulation

### **Navigation (4 pts)**
- [ ] BottomNavigationBar with 3 screens
- [ ] Smooth navigation between screens
- [ ] Proper screen state management

### **UI/UX (4 pts)**
- [ ] Material Design compliance
- [ ] Clean, consistent interface
- [ ] Responsive design (portrait/landscape)
- [ ] Proper spacing and typography

### **Local Storage (5 pts)**
- [ ] Tasks persist after app restart
- [ ] JSON serialization working
- [ ] Storage method indicator
- [ ] Data validation and error handling

### **Code Quality (7 pts)**
- [ ] Well-organized folder structure
- [ ] Meaningful variable names
- [ ] Proper comments and documentation
- [ ] Modular, reusable code
- [ ] README with setup instructions

### **Video Demo (5 pts)**
- [ ] 5-10 minute tutorial-style video
- [ ] Shows code implementation
- [ ] Explains each feature step-by-step
- [ ] Demonstrates all functionality
- [ ] Clear, educational presentation

---

## 🎯 **Final Deliverables**

1. **Complete Flutter App** - All features implemented
2. **GitHub Repository** - Well-documented code
3. **Demo Video** - 5-10 minute tutorial
4. **PDF Document** - GitHub link + video link
5. **README.md** - Setup and architecture documentation

---

## ⚡ **Quick Start Commands**

```bash
# Clean and get dependencies
flutter clean
flutter pub get

# Run on device/emulator
flutter run

# Build for release
flutter build apk
```

---

## 🆘 **Emergency Backup Plan**

If we run short on time:
1. **Priority 1:** Core task management + storage
2. **Priority 2:** Basic calendar + navigation  
3. **Priority 3:** Settings + reminders
4. **Priority 4:** UI polish + demo video

**Remember:** A working app with core features is better than a perfect but incomplete app!

---

*This plan ensures we build a robust, feature-complete Study Planner App that meets all assignment requirements within the 2-hour timeframe.*
