# AnimateText

[AnimateText](https://www.pub.dev/packages/animate_text) ជួយលោកអ្នក ក្នុងការធ្វើតួរអក្សរឲ្យមានចលនាតាមការចង់បាន
<br />

[AnimateText](https://www.pub.dev/packages/animate_text) helps you to animate text easy with scale, opacity, transform, blur.

<hr />
<p align="center">
  <img src="https://raw.githubusercontent.com/RathaIct/AnimateText/main/thumbnail.gif"/>
</p>
<p align="center">
  <a href="https://flutter.io">  
    <img src="https://img.shields.io/badge/Platform-Flutter-yellow.svg"  
      alt="Platform" />  
  </a> 
   <a href="https://pub.dev/packages/animate_text">  
    <img src="https://img.shields.io/pub/v/animated_text.svg"  
      alt="Pub Package" />  
  </a>
   <a href="https://opensource.org/licenses/MIT">  
    <img src="https://img.shields.io/badge/License-MIT-red.svg"  
      alt="License: MIT" />  
  </a>
   <a href="https://github.com/RathaIct/AnimateText/issues">  
    <img src="https://img.shields.io/github/issues/RathaIct/AnimateText"  
      alt="Issue" />  
  </a> 
   <a href="https://github.com/RathaIct/AnimateText/network">  
    <img src="https://img.shields.io/github/forks/RathaIct/AnimateText"  
      alt="Forks" />  
  </a> 
   <a href="https://github.com/RathaIct/AnimateText/stargazers">  
    <img src="https://img.shields.io/github/stars/RathaIct/AnimateText"  
      alt="Stars" />  
  </a>
</p>
<br />

## Installing

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  animate_text: ^0.0.5
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```bash
$ pub get
```

with `Flutter`:

```bash
$ flutter pub get
```

### 3. Import it

Now in your `Dart` code, you can use:

```dart
import 'package:animate_text/animate_text.dart';
```

## Usage

`AnimateText` is a _Stateful Widget_ that produces text animations.
Include it in your `build` method like:

```dart
AnimateText(
  "Hello World!",
  style: TextStyle(fontSize: 20),
  type: AnimateTextType.bottomToTop,
)
```

### Configurable properties, including:

- `style` – custom text style what you want use TextStyle.
- `type` – default `AnimateTextType.bottomToTop` other options:
  - `AnimateTextType.none` - no animation transform
  - `AnimateTextType.bottomToTop` - animation transform text from bottom to top
  - `AnimateTextType.topToBottom` - animation transform text from top to bottom
  - `AnimateTextType.leftToRight` - animation transform text from left to right
  - `AnimateTextType.bottomLeftToTopRight` - animation transform text from bottom left to top right
  - `AnimateTextType.bottomRightToTopLeft` - animation transform text from bottom right to top left
  - `AnimateTextType.topLeftToBottomRight` - animation transform text from top left to bottom right
  - `AnimateTextType.topRightToBottomLeft` - animation transform text from top right to bottom left
- `withOpacity`- default `false` joint animation opacity if set `true`
- `withBlur`- default `false` joint animation blur if set `true`
- `withRotate`- default `false` joint animation rotate if set `true`
- `withScale`- default `false` joint animation scale if set `true`
- `isScaleOut`- default `false` this option work with `withScale` option if it set to `true`
- `seconds`- default `3` duration run animation
- `isRepeat`- default `true` repeat animation if set `false` it will run only first time.
- `curve`- The curve to use in the forward direction.
- `speed`- default `AnimateTextSpeed.medium` other options:
  - `AnimateTextSpeed.verySlow` - speed animation run text each character speed very slow
  - `AnimateTextSpeed.slow` - speed animation run text each character speed slow
  - `AnimateTextSpeed.medium` - speed animation run text each character speed medium
  - `AnimateTextSpeed.fast` - speed animation run text each character speed fast
  - `AnimateTextSpeed.veryFast` - speed animation run text each character speed very fast

<p align="center">
  <img src="https://raw.githubusercontent.com/RathaIct/AnimateText/main/animated_text.gif"/>
</p>
<br />

### Noted

AnimateText allow you to use for only one line of text.

## អ្នកបង្កើត

<img src="https://raw.githubusercontent.com/RathaIct/AnimateText/main/ratha.jpeg" width="150" />
<hr />
លោក ហ៊ិន រដ្ឋា
Mr. Hin Ratha
<br />
ជំនាញ បង្កើតកម្មវិធីទូរស័ព្ទ
Mobile Apps Developer
<br />
បទពិសោធន៍ Flutter, ReactNative
<br />
ទូរស័ព្ទ 096 659 2250

### គេហទំព័រ

<a href="https://rathadev.com"  target="_blank">Ratha Dev</a>
