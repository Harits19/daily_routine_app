import 'package:package_info_plus/package_info_plus.dart';

class AppService {
  static Future<PackageInfo> getAppDetail() {
    return PackageInfo.fromPlatform();
  }
}
