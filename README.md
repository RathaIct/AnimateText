# animate_text

Create text animation easy.
<br />
<img src="https://raw.githubusercontent.com/RathaIct/AnimateText/main/animated_text.gif"/>

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:animate_text/animate_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Animate Text"),
          backgroundColor: Colors.blue,
        ),
        body: const SingleChildScrollView(
          child: Center(
            child: AnimateText(
              "Hello World!",
              style: TextStyle(fontSize: 20),
              type: AnimateTextType.bottomToTop,
            ),
          ),
        ),
      ),
    );
  }
}

```

## Noted

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
