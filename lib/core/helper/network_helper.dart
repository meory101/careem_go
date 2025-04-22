// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// /// created by eng nour othman ***
// /// at 7/4/2025
//
// abstract class NetworkHelper {
//   // Connection Checker Function
//   static Future<CheckConnectionModel> checkInternetConnection() async {
//     bool isConnected = await InternetConnection().hasInternetAccess;
//
//     return CheckConnectionModel(
//       isConnected: isConnected,
//       message: isConnected ? 'Connected' : 'pleaseTurnOnWifiOrMobileData'.tr(),
//     );
//   }
// }
//
// class CheckConnectionModel {
//   final String message;
//   final bool isConnected;
//
//   CheckConnectionModel({
//     required this.message,
//     required this.isConnected,
//   });
// }
