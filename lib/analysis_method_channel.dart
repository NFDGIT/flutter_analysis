import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'analysis_platform_interface.dart';

/// An implementation of [AnalysisPlatform] that uses method channels.
class MethodChannelAnalysis extends AnalysisPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('analysis');

  /// 获取iOS 归因token
  @override
  Future<String?> getIOSAttributionToken()async {
    final iOSAttributionToken = await methodChannel.invokeMethod<String>('getIOSAttributionToken');
    return iOSAttributionToken;
  }
  /// 获取设备id
  @override
  Future<String?> getDeviceId() async{
    final deviceId = await methodChannel.invokeMethod<String>('getDeviceId');
    return deviceId;
  }

}
