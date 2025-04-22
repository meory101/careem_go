import 'package:package_info_plus/package_info_plus.dart';

///
/// created by eng nour othman ***
/// at 7/4/2025
///

abstract class AppInfoHelper {
  static PackageInfo? packageInfo;


  static String getAppVersion() {
    return packageInfo?.version ?? "";
  }
}
