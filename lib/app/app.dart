import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../core/theme/app_theme.dart';
import '../router/router.dart';

///
/// created by eng nour othman ***
/// at 7/4/2025
///


final GlobalKey<NavigatorState> myAppKey = GlobalKey<NavigatorState>();

class CareemGo extends StatefulWidget {
  const CareemGo({super.key});

  @override
  State<CareemGo> createState() => _careem_goState();
}

class _careem_goState extends State<CareemGo> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        theme: lightTheme(),
        navigatorKey: myAppKey,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: RouteNamedScreens.init,
      );
    });
  }
}
