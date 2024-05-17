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
          title: const Text("Animated Text"),
          backgroundColor: Colors.blue,
        ),
        body: const SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimateText(
                  "Hello World!",
                  style: TextStyle(fontSize: 20),
                  type: AnimateTextType.bottomToTop,
                ),
                AnimateText(
                  "bottomLeftToTopRight",
                  style: TextStyle(fontSize: 20),
                  type: AnimateTextType.bottomLeftToTopRight,
                ),
                AnimateText(
                  "bottomLeftToTopRight",
                  style: TextStyle(fontSize: 20),
                  type: AnimateTextType.bottomRightToTopLeft,
                ),
                AnimateText(
                  "topToBottom",
                  style: TextStyle(fontSize: 20),
                  type: AnimateTextType.topToBottom,
                ),
                AnimateText(
                  "topLeftToBottomRight",
                  style: TextStyle(fontSize: 20),
                  type: AnimateTextType.topLeftToBottomRight,
                ),
                AnimateText(
                  "topRightToBottomLeft",
                  style: TextStyle(fontSize: 20),
                  type: AnimateTextType.topRightToBottomLeft,
                ),
                AnimateText(
                  "leftToRight",
                  style: TextStyle(fontSize: 20),
                  type: AnimateTextType.leftToRight,
                ),
                AnimateText(
                  "none with opacity",
                  style: TextStyle(fontSize: 20),
                  type: AnimateTextType.none,
                  withOpacity: true,
                ),
                AnimateText(
                  "none with rotate",
                  style: TextStyle(fontSize: 20),
                  type: AnimateTextType.none,
                  withRotate: true,
                ),
                AnimateText(
                  "none with blur",
                  style: TextStyle(fontSize: 20),
                  type: AnimateTextType.none,
                  withBlur: true,
                ),
                AnimateText(
                  "none with scale",
                  style: TextStyle(fontSize: 20),
                  type: AnimateTextType.none,
                  withScale: true,
                ),
                AnimateText(
                  "topRightToBottomLeft with rotate",
                  style: TextStyle(fontSize: 20),
                  type: AnimateTextType.topRightToBottomLeft,
                  withRotate: true,
                ),
                AnimateText(
                  "bottomToTop with rotate with opacity",
                  style: TextStyle(fontSize: 20),
                  type: AnimateTextType.bottomToTop,
                  withRotate: true,
                  withOpacity: true,
                ),
                AnimateText(
                  "bottomToTop with rotate with opacity with blur",
                  style: TextStyle(fontSize: 20),
                  type: AnimateTextType.bottomToTop,
                  withRotate: true,
                  withOpacity: true,
                  withBlur: true,
                ),
                AnimateText(
                  "bottomToTop with rotate with opacity with blur with scale",
                  style: TextStyle(fontSize: 16),
                  type: AnimateTextType.bottomToTop,
                  withRotate: true,
                  withOpacity: true,
                  withBlur: true,
                  withScale: true,
                ),
                AnimateText(
                  "bottomToTop with opacity with blur with scale",
                  style: TextStyle(fontSize: 16),
                  type: AnimateTextType.bottomToTop,
                  withOpacity: true,
                  withBlur: true,
                  withScale: true,
                ),
                AnimateText(
                  "bottomToTop with rotate with opacity speed very fast",
                  style: TextStyle(fontSize: 16),
                  type: AnimateTextType.bottomToTop,
                  withOpacity: true,
                  withRotate: true,
                  speed: AnimateTextSpeed.veryFast,
                ),
                AnimateText(
                  "bottomToTop with scale",
                  style: TextStyle(fontSize: 16),
                  type: AnimateTextType.bottomToTop,
                  withScale: true,
                ),
                AnimateText(
                  "topLeftToBottomRight with opacity, 10s",
                  style: TextStyle(fontSize: 16),
                  type: AnimateTextType.topLeftToBottomRight,
                  withOpacity: true,
                  seconds: 10,
                ),
                AnimateText(
                  "bottomToTop with scale not repeat",
                  style: TextStyle(fontSize: 16),
                  type: AnimateTextType.topToBottom,
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
