import 'package:flutter/cupertino.dart';
import '../../resource/color_manager.dart';
import '../../resource/font_manager.dart';

///
/// created by eng nour othman ***
/// at 7/4/2025
///

class RequiredTextWidget extends StatelessWidget {
  final String title;

  const RequiredTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: title,
          style: TextStyle(
              color: AppColorManager.textAppColor,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamilyManager.cairo,
              fontSize: FontSizeManager.fs16),
          children: [
            TextSpan(
              text: ' *',
              style: TextStyle(
                  color: AppColorManager.red,
                  fontWeight: FontWeight.w600,
                  fontFamily: FontFamilyManager.cairo,
                  fontSize: FontSizeManager.fs16),
            )
          ]),
    );
  }
}
