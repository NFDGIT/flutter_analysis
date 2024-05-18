import Flutter
import UIKit
import AdServices

public class AnalysisPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "analysis", binaryMessenger: registrar.messenger())
    let instance = AnalysisPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getIOSAttributionToken":
        if #available(iOS 14.3, *) {
            do {
                let token =  try AAAttribution.attributionToken()
                result(token)
            }catch{
                result("");
            }
        } else {
            result("");
            // Fallback on earlier versions
        };
    case "getDeviceId":
      let uuid = UIDevice.current.identifierForVendor?.uuidString
      result(uuid)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
