import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class AnimateText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final AnimateTextType type;
  final int seconds;
  final bool withRotate;
  final bool withOpacity;
  final bool withScale;
  final bool withBlur;
  final Curve curve;
  final AnimateTextSpeed speed;
  final bool isRepeat;

  final bool isScaleOut;
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
  late final List<AnimationController> _controllers;
  late final List<Animation<Offset>> _animations;
  late final List<Animation<double>> _rotateAnimations;
  late final List<Animation<double>> _opacityAnimations;
  late final List<Animation<double>> _scaleAnimations;
  late final List<Animation<double>> _blurAnimations;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimationCycle();
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

enum AnimateTextSpeed {
  verySlow,
  slow,
  medium,
  fast,
  veryFast,
}

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
