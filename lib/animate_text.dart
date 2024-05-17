import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class AnimateText extends StatefulWidget {
  final String text;

  /// Set your text style use TextStyle
  final TextStyle? style;

  /// - `type` – default `AnimateTextType.bottomToTop` other options:
  /// - `AnimateTextType.none` - no animation transform
  /// - `AnimateTextType.bottomToTop` - animation transform text from bottom to top
  /// - `AnimateTextType.topToBottom` - animation transform text from top to bottom
  /// - `AnimateTextType.leftToRight` - animation transform text from left to right
  /// - `AnimateTextType.bottomLeftToTopRight` - animation transform text from bottom left to top right
  /// - `AnimateTextType.bottomRightToTopLeft` - animation transform text from bottom right to top left
  /// - `AnimateTextType.topLeftToBottomRight` - animation transform text from top left to bottom right
  /// - `AnimateTextType.topRightToBottomLeft` - animation transform text from top right to bottom left
  final AnimateTextType type;

  /// - `seconds`- default `3` duration run animation
  final int seconds;

  /// - `withRotate`- default `false` joint animation rotate if set `true`
  final bool withRotate;

  /// - `withOpacity`- default `false` joint animation opacity if set `true`
  final bool withOpacity;

  /// - `withScale`- default `false` joint animation scale if set `true`
  final bool withScale;

  /// - `withBlur`- default `false` joint animation blur if set `true`
  final bool withBlur;

  /// The curve to use in the forward direction.
  final Curve curve;

  /// - `speed`- default `AnimateTextSpeed.medium` other options:
  /// - `AnimateTextSpeed.verySlow` - speed animation run text each character speed very slow
  /// - `AnimateTextSpeed.slow` - speed animation run text each character speed slow
  /// - `AnimateTextSpeed.medium` - speed animation run text each character speed medium
  /// - `AnimateTextSpeed.fast` - speed animation run text each character speed fast
  /// - `AnimateTextSpeed.veryFast` - speed animation run text each character speed very fast
  final AnimateTextSpeed speed;

  /// - `isRepeat`- default `true` repeat animation if set `false` it will run only first time.
  final bool isRepeat;

  /// - `isScaleOut`- default `false` this option work with `withScale` option if it set to `true`
  final bool isScaleOut;

  /// បង្កើតដោយលោក ហ៊ិន រដ្ឋា
  ///
  /// Develop by Hin Ratha
  /// - Tel: 096 659 22 50
  const AnimateText(
    this.text, {
    super.key,
    this.style,
    this.type = AnimateTextType.bottomToTop,
    this.withRotate = false,
    this.withOpacity = false,
    this.isRepeat = true,
    this.seconds = 5,
    this.curve = Curves.fastOutSlowIn,
    this.speed = AnimateTextSpeed.medium,
    this.withScale = false,
    this.withBlur = false,
    this.isScaleOut = false,
  });
  @override
  State<AnimateText> createState() => _AnimateTextState();
}

class _AnimateTextState extends State<AnimateText>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _animations;
  late List<Animation<double>> _rotateAnimations;
  late List<Animation<double>> _opacityAnimations;
  late List<Animation<double>> _scaleAnimations;
  late List<Animation<double>> _blurAnimations;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimationCycle();
  }

  @override
  void didUpdateWidget(AnimateText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget != oldWidget) {
      for (final controller in _controllers) {
        controller.dispose();
      }
      _timer?.cancel();
      _initializeAnimations();
      _startAnimationCycle();
    }
  }

  void _initializeAnimations() {
    _controllers = List<AnimationController>.generate(
      widget.text.length,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      ),
    );

    _animations = _controllers.map((controller) {
      Offset begin = const Offset(0, 0);
      Offset end = Offset.zero;
      if (widget.type == AnimateTextType.topToBottom) {
        begin = const Offset(0, -1.0);
      } else if (widget.type == AnimateTextType.leftToRight) {
        begin = const Offset(0.5, 0);
      } else if (widget.type == AnimateTextType.bottomLeftToTopRight) {
        begin = const Offset(-1.0, 1.0);
      } else if (widget.type == AnimateTextType.bottomRightToTopLeft) {
        begin = const Offset(1.0, 1.0);
      } else if (widget.type == AnimateTextType.topLeftToBottomRight) {
        begin = const Offset(-1.0, -1.0);
      } else if (widget.type == AnimateTextType.topRightToBottomLeft) {
        begin = const Offset(1.0, -1.0);
      } else if (widget.type == AnimateTextType.bottomToTop) {
        begin = const Offset(0, 1.0);
      } else if (widget.type == AnimateTextType.none) {
        begin = const Offset(0, 0);
      }

      return Tween<Offset>(
        begin: begin,
        end: end,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: widget.curve,
        ),
      );
    }).toList();
    _rotateAnimations = _controllers.map((controller) {
      return Tween<double>(
        begin: 0.0,
        end: widget.withRotate ? 1.0 : 0.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: widget.curve,
        ),
      );
    }).toList();
    _opacityAnimations = _controllers.map((controller) {
      return Tween<double>(
        begin: widget.withOpacity ? 0.0 : 1.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );
    }).toList();
    _scaleAnimations = _controllers.map((controller) {
      return Tween<double>(
        begin: widget.withScale ? (widget.isScaleOut ? 10.0 : 0.0) : 1.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );
    }).toList();
    _blurAnimations = _controllers.map((controller) {
      return Tween<double>(
        begin: widget.withBlur ? 5.0 : 0.0,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );
    }).toList();
  }

  void _startAnimationCycle() {
    _startAnimation();
    if (widget.isRepeat) {
      _timer = Timer.periodic(Duration(seconds: widget.seconds), (timer) {
        _reverseAnimation();
        Future.delayed(const Duration(milliseconds: 800), _startAnimation);
      });
    }
  }

  void _startAnimation() {
    int delay = 0;
    for (final controller in _controllers) {
      Future.delayed(Duration(milliseconds: delay), () {
        controller.forward();
      });
      delay += getSpeed(widget.speed);
    }
  }

  void _reverseAnimation() {
    int delay = 0;
    for (final controller in _controllers) {
      Future.delayed(Duration(milliseconds: delay), () {
        controller.reverse();
      });
      delay += getSpeed(widget.speed);
    }
  }

  int getSpeed(AnimateTextSpeed speed) {
    switch (speed) {
      case AnimateTextSpeed.verySlow:
        return 100;
      case AnimateTextSpeed.slow:
        return 80;
      case AnimateTextSpeed.medium:
        return 60;
      case AnimateTextSpeed.fast:
        return 30;
      case AnimateTextSpeed.veryFast:
        return 20;
      default:
        return 60;
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0,
          child: Text(
            widget.text,
            style: widget.style,
          ),
        ),
        Positioned(
          bottom: 1,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.text.length, (index) {
              return ScaleTransition(
                scale: _scaleAnimations[index],
                child: FadeTransition(
                  opacity: _opacityAnimations[index],
                  child: RotationTransition(
                    turns: _rotateAnimations[index],
                    child: SlideTransition(
                      position: _animations[index],
                      child: AnimatedBuilder(
                        animation: _controllers[index],
                        builder: (context, child) {
                          return ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: _blurAnimations[index].value,
                              sigmaY: _blurAnimations[index].value,
                            ),
                            child: Text(
                              widget.text[index],
                              style: widget.style,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

/// - `AnimateTextSpeed.verySlow` - speed animation run text each character speed very slow
/// - `AnimateTextSpeed.slow` - speed animation run text each character speed slow
/// - `AnimateTextSpeed.medium` - speed animation run text each character speed medium
/// - `AnimateTextSpeed.fast` - speed animation run text each character speed fast
/// - `AnimateTextSpeed.veryFast` - speed animation run text each character speed very fast
enum AnimateTextSpeed {
  verySlow,
  slow,
  medium,
  fast,
  veryFast,
}

/// - `AnimateTextType.none` - no animation transform
/// - `AnimateTextType.bottomToTop` - animation transform text from bottom to top
/// - `AnimateTextType.topToBottom` - animation transform text from top to bottom
/// - `AnimateTextType.leftToRight` - animation transform text from left to right
/// - `AnimateTextType.bottomLeftToTopRight` - animation transform text from bottom left to top right
/// - `AnimateTextType.bottomRightToTopLeft` - animation transform text from bottom right to top left
/// - `AnimateTextType.topLeftToBottomRight` - animation transform text from top left to bottom right
/// - `AnimateTextType.topRightToBottomLeft` - animation transform text from top right to bottom left
enum AnimateTextType {
  none,
  bottomToTop,
  topToBottom,
  leftToRight,
  bottomLeftToTopRight,
  bottomRightToTopLeft,
  topLeftToBottomRight,
  topRightToBottomLeft,
}
