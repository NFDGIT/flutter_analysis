import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'analysis_method_channel.dart';

abstract class AnalysisPlatform extends PlatformInterface {
  /// Constructs a AnalysisPlatform.
  AnalysisPlatform() : super(token: _token);

  static final Object _token = Object();

  static AnalysisPlatform _instance = MethodChannelAnalysis();

  /// The default instance of [AnalysisPlatform] to use.
  ///
  /// Defaults to [MethodChannelAnalysis].
  static AnalysisPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AnalysisPlatform] when
  /// they register themselves.
  static set instance(AnalysisPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
  /// 获取iOS 归因token
  Future<String?> getIOSAttributionToken();
  /// 获取设备id
  Future<String?> getDeviceId();
}
