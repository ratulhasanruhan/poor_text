# 💸 poor_text

**_Text rendering for the broke and the bold._**

`poor_text` is a Flutter widget that parodies `RichText`. It's the best worst way to render text in your app.

---

## ✨ Features

- 🧑‍🎨 **No rich styling**: You get what you pay for.
- 🎨 **Greyscale color by default**: Color is a premium.
- 🔤 **Random Google Fonts**: We use the "forgotten" fonts.
- 🕰 **Laggy rendering**: For that slow, nostalgic effect.
- 🪛 **Auto-shrink text**: The longer your string, the tinier it becomes.
- 📄 **Pretend rich text**: HTML tags get stripped and mocked.
- 🧃 **Fake PoorTextRich**: Styled spans... except they're not.

---

## 🚀 Getting Started

### Install

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  poor_text:
    git:
      url: https://github.com/ratulhasanruhan/poor_text.git
```

> _We're too broke for pub.dev. Git is cheaper._

### Import

```dart
import 'package:poor_text/poor_text.dart';
```

### Basic Usage

```dart
PoorText(
'This is budget UI text.',
autoShrink: true,
laggy: true,
style: PoorTextStyle(allowColor: false),
)
```

### Pretend Rich

```dart
PoorText(
'<b>This is bold?</b>',
pretendRich: true,
)
```

### PoorTextRich

```dart
PoorTextRich([
PoorTextSpan(text: 'Still broke'),
PoorTextSpan(text: ' and can\'t style.'),
])
```

---

## 🧪 Run Tests

```bash
flutter test
```

We test failure. Thoroughly.

---

## 🫠 Disclaimer

This package is a parody and shouldn't be used in production.
Unless you're really going for that "early web" aesthetic.

---

## 📜 License

MIT, because we're too poor to write our own license.
