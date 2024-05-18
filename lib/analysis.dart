
import 'analysis_platform_interface.dart';

class Analysis {
  /// 获取iOS归因token
  Future<String?> getIOSAttributionToken()async {
    if (!Platform.isIOS) {
      return null;
    }
    return await AnalysisPlatform.instance.getIOSAttributionToken();
  }
  /// 获取设备id
  Future<String?> getDeviceId() async{
    if (!Platform.isIOS) {
      return null;
    }
    return await AnalysisPlatform.instance.getDeviceId();
  }
}
