# 🔐 PinView 

A **fully customizable Flutter PIN / OTP input library** that supports  
**Box**, **Underline**, and **Circle** styles with complete control over **size, spacing, radius, colors, and text style**.


---

## ✨ Features

✅ Box PIN View  
✅ Underline PIN View  
✅ Circle PIN View  
✅ Custom PIN length (4, 6, etc.)  
✅ Custom box size, radius & spacing  
✅ Custom colors & text styles  
✅ Obscure / secure PIN support  
✅ Clean focus handling  
✅ Zero external dependencies  
✅ Easy to convert & scale  

---

## 📸 Preview
<img 
  src="https://github.com/user-attachments/assets/6e29a0ff-9d20-4243-a417-2475caa76e7d" 
  width="280"
/>



---

## 📦 Installation

### Add dependency in pubspec.yaml:
```yaml
dependencies:
  pin_view:
    path:
      url: '.../flutter_custom_pin_view/pin_view' ## your path
```

### Using GitHub (recommended during development):
```yaml
dependencies:
  pin_view:
    git:
      url: https://github.com/YOUR_USERNAME/flutter_custom_pin_view.git
```

---

## 🚀 Usage
```dart
import 'package:pin_view/pin_view.dart';
```

### 🔳 Box PinView
```dart
PinView(
  length: 4,
  boxSize: 55,
  spacing: 10,
  borderRadius: 12,
  fillColor: Colors.white,
  borderColor: Colors.grey,
  focusedBorderColor: Colors.blue,
  textStyle: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
  onCompleted: (pin) {
    print('PIN: $pin');
  },
)
```

### ➖ Underline PinView
```dart
UnderlinePinView(
  length: 4,
  boxSize: 50,
  spacing: 12,
  underlineColor: Colors.grey,
  focusedUnderlineColor: Colors.blue,
  textStyle: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
  onCompleted: (pin) {
    print('PIN: $pin');
  },
)
```

### 🔵 Circle PinView
```dart
CirclePinView(
  length: 4,
  boxSize: 60,
  spacing: 14,
  fillColor: Colors.grey.shade100,
  borderColor: Colors.grey,
  focusedBorderColor: Colors.deepPurple,
  textStyle: const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
  onCompleted: (pin) {
    print('PIN: $pin');
  },
)
```

---

## 🎨 Style Customization Options
| Property             | Description                    |
| -------------------- | ------------------------------ |
| `boxSize`            | Width & height of each PIN box |
| `spacing`            | Space between boxes            |
| `borderRadius`       | Corner radius (Box PinView)    |
| `fillColor`          | Background color               |
| `borderColor`        | Normal border color            |
| `focusedBorderColor` | Focused border color           |
| `textStyle`          | Text style inside box          |
| `obscure`            | Hide PIN characters            |

---

## 📁 Library Structure
```text
pin_view/
│
├── lib/
│   ├── pin_view.dart              # main export file
│   │
│   ├── core/
│   │   ├── theme/
│   │   │   └── app_colors.dart
│   │   └── utils/
│   │       └── app_constants.dart
│   │
│   └── src/
│       ├── pin_controller.dart
│       │
│       ├── box/
│       │   ├── pin_box.dart
│       │   └── pin_view.dart
│       │
│       ├── underline/
│       │   ├── pin_underline_box.dart
│       │   └── underline_pin_view.dart
│       │
│       └── circle/
│           ├── pin_circle_box.dart
│           └── circle_pin_view.dart

```

---

## 📄 License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```

