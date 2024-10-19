# 📱 FocusGuard

FocusGuard is a productivity and focus management app designed to block distractions, track screen time, and help you stay focused on what matters. With its app blocker, screen time tracker, Pomodoro timer, and productivity tips, FocusGuard is the perfect tool to manage your time better!

![FocusGuard](https://example.com/your-app-screenshot.png)

## ✨ Features

- **App Blocker** 🔒: Block distracting apps, websites, notifications, and shorts. Includes:
    - App Blocker 🛑
    - Website Blocker 🌐
    - Notification Blocker 🔕
    - Shorts Blocker 🎥
- **Screen Time Tracker** ⏳: Get detailed stats on how much time you spend on each app and how often you open them.
- **Pomodoro Timer** ⏲️: Stay productive with the Pomodoro technique — focus on tasks with timed breaks.
- **Productivity Tips** 💡: Scroll through helpful tips designed to boost your focus and efficiency.
- **Overlay Feature** 🖼️: Display an overlay when blocked apps are opened to help stay on track.
- **Background Services** 🚀: Keep tracking and blocking apps while running in the background.

## 🖥️ Screens

### Home 🏠
- Displays usage stats and the Pomodoro timer.
- Ripple button for starting, pausing, and resetting the Pomodoro timer.

### Blocker 🔒
- Select apps, websites, and notifications to block.

### Track 📊
- View detailed app usage statistics including time spent and number of app launches.

### Tips 💡
- Browse a horizontal list of productivity tips.

### Help and Feedback ❓
- Get support and share feedback on how to improve the app.

## 🔧 Tech Stack

- **Flutter**: Framework used to build this cross-platform mobile app.
- **SQLite**: Local database for storing blocked apps and usage data.
- **Accessibility Service**: Tracks app usage and shows the overlay.
- **Flutter Packages**:
    - `flutter_accessibility_service`: Interacts with Android's accessibility features.
    - `optimize_battery`: Manages battery optimization for background services.
    - `usage_stats_new`: Tracks app usage.
    - `flutter_overlay_window`: Displays overlays when blocked apps are launched.
    - `sqflite`: Manages local SQLite database.

## 🚀 Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/FocusGuard.git
   cd FocusGuard
