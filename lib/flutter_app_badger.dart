import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class FlutterAppBadger {
  static const MethodChannel _channel = const MethodChannel('g123k/flutter_app_badger');

  /// only Android
  static void initConfig() {
    if (Platform.isAndroid) {
      _channel.invokeMethod('initConfig');
    }
  }

  static void updateBadgeCount(int count) {
    _channel.invokeMethod('updateBadgeCount', {"count": count});
  }

  static void removeBadge() {
    _channel.invokeMethod('removeBadge');
  }

  static Future<bool> isAppBadgeSupported() async {
    bool? appBadgeSupported = await _channel.invokeMethod('isAppBadgeSupported');
    return appBadgeSupported ?? false;
  }
}
