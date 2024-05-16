import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'animate_text_method_channel.dart';

abstract class AnimatedTextPlatform extends PlatformInterface {
  /// Constructs a AnimatedTextPlatform.
  AnimatedTextPlatform() : super(token: _token);

  static final Object _token = Object();

  static AnimatedTextPlatform _instance = MethodChannelAnimatedText();

  /// The default instance of [AnimatedTextPlatform] to use.
  ///
  /// Defaults to [MethodChannelAnimatedText].
  static AnimatedTextPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AnimatedTextPlatform] when
  /// they register themselves.
  static set instance(AnimatedTextPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
