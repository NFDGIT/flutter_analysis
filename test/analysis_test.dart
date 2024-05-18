import 'package:flutter_test/flutter_test.dart';
import 'package:analysis/analysis.dart';
import 'package:analysis/analysis_platform_interface.dart';
import 'package:analysis/analysis_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAnalysisPlatform
    with MockPlatformInterfaceMixin
    implements AnalysisPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AnalysisPlatform initialPlatform = AnalysisPlatform.instance;

  test('$MethodChannelAnalysis is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAnalysis>());
  });

  test('getPlatformVersion', () async {
    Analysis analysisPlugin = Analysis();
    MockAnalysisPlatform fakePlatform = MockAnalysisPlatform();
    AnalysisPlatform.instance = fakePlatform;

    expect(await analysisPlugin.getPlatformVersion(), '42');
  });
}
