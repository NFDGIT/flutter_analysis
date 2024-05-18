
import 'analysis_platform_interface.dart';

class Analysis {
  /// 获取iOS归因token
  Future<String?> getIOSAttributionToken()async {
    return await AnalysisPlatform.instance.getIOSAttributionToken();
  }
  /// 获取设备id
  Future<String?> getDeviceId() async{
    return await AnalysisPlatform.instance.getDeviceId();
  }
}
