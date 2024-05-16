import 'package:flutter/material.dart';
import 'package:animated_text/animated_text.dart';

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
          title: const Text("Animated Text"),
          backgroundColor: Colors.blue,
        ),
        body: const SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedText(
                  "bottomToTop",
                  style: TextStyle(fontSize: 20),
                  type: AnimatedTextType.bottomToTop,
                ),
                AnimatedText(
                  "bottomLeftToTopRight",
                  style: TextStyle(fontSize: 20),
                  type: AnimatedTextType.bottomLeftToTopRight,
                ),
                AnimatedText(
                  "bottomLeftToTopRight",
                  style: TextStyle(fontSize: 20),
                  type: AnimatedTextType.bottomRightToTopLeft,
                ),
                AnimatedText(
                  "topToBottom",
                  style: TextStyle(fontSize: 20),
                  type: AnimatedTextType.topToBottom,
                ),
                AnimatedText(
                  "topLeftToBottomRight",
                  style: TextStyle(fontSize: 20),
                  type: AnimatedTextType.topLeftToBottomRight,
                ),
                AnimatedText(
                  "topRightToBottomLeft",
                  style: TextStyle(fontSize: 20),
                  type: AnimatedTextType.topRightToBottomLeft,
                ),
                AnimatedText(
                  "leftToRight",
                  style: TextStyle(fontSize: 20),
                  type: AnimatedTextType.leftToRight,
                ),
                AnimatedText(
                  "none with opacity",
                  style: TextStyle(fontSize: 20),
                  type: AnimatedTextType.none,
                  withOpacity: true,
                ),
                AnimatedText(
                  "none with rotate",
                  style: TextStyle(fontSize: 20),
                  type: AnimatedTextType.none,
                  withRotate: true,
                ),
                AnimatedText(
                  "none with blur",
                  style: TextStyle(fontSize: 20),
                  type: AnimatedTextType.none,
                  withBlur: true,
                ),
                AnimatedText(
                  "none with scale",
                  style: TextStyle(fontSize: 20),
                  type: AnimatedTextType.none,
                  withScale: true,
                ),
                AnimatedText(
                  "topRightToBottomLeft with rotate",
                  style: TextStyle(fontSize: 20),
                  type: AnimatedTextType.topRightToBottomLeft,
                  withRotate: true,
                ),
                AnimatedText(
                  "bottomToTop with rotate with opacity",
                  style: TextStyle(fontSize: 20),
                  type: AnimatedTextType.bottomToTop,
                  withRotate: true,
                  withOpacity: true,
                ),
                AnimatedText(
                  "bottomToTop with rotate with opacity with blur",
                  style: TextStyle(fontSize: 20),
                  type: AnimatedTextType.bottomToTop,
                  withRotate: true,
                  withOpacity: true,
                  withBlur: true,
                ),
                AnimatedText(
                  "bottomToTop with rotate with opacity with blur with scale",
                  style: TextStyle(fontSize: 16),
                  type: AnimatedTextType.bottomToTop,
                  withRotate: true,
                  withOpacity: true,
                  withBlur: true,
                  withScale: true,
                ),
                AnimatedText(
                  "bottomToTop with opacity with blur with scale",
                  style: TextStyle(fontSize: 16),
                  type: AnimatedTextType.bottomToTop,
                  withOpacity: true,
                  withBlur: true,
                  withScale: true,
                ),
                AnimatedText(
                  "bottomToTop with rotate with opacity speed very fast",
                  style: TextStyle(fontSize: 16),
                  type: AnimatedTextType.bottomToTop,
                  withOpacity: true,
                  withRotate: true,
                  speed: AnimatedSpeed.veryFast,
                ),
                AnimatedText(
                  "bottomToTop with scale",
                  style: TextStyle(fontSize: 16),
                  type: AnimatedTextType.bottomToTop,
                  withScale: true,
                ),
                AnimatedText(
                  "topLeftToBottomRight with opacity, 10s",
                  style: TextStyle(fontSize: 16),
                  type: AnimatedTextType.topLeftToBottomRight,
                  withOpacity: true,
                  seconds: 10,
                ),
                AnimatedText(
                  "bottomToTop with scale not repeat",
                  style: TextStyle(fontSize: 16),
                  type: AnimatedTextType.topToBottom,
                  withScale: true,
                  isRepeat: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
