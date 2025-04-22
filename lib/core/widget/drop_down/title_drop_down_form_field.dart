import 'package:flutter/cupertino.dart';

import '../../resource/color_manager.dart';
import '../../resource/font_manager.dart';
import '../../resource/size_manager.dart';
import '../text/app_text_widget.dart';
import 'NameAndId.dart';
import 'drop_down_form_field.dart';

///
/// created by eng nour othman
/// at 9/3/2025
///
class TitleDropDownFormFieldWidget extends StatelessWidget {
  final String title, hint;
  final List<NameAndId> options;
  final String? Function(NameAndId?)? validator;
  final Function(NameAndId?)? onChanged;
  final Color? hintFontColor;

  const TitleDropDownFormFieldWidget(
      {super.key,
      required this.hint,
      required this.title,
        this.hintFontColor,

         this.validator,
        this.onChanged,
      required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextWidget(
          text: title,
          fontSize: FontSizeManager.fs16,
          fontWeight: FontWeight.w600,
          color: AppColorManager.textAppColor,
        ),
        SizedBox(
          height: AppHeightManager.h1point5,
        ),
        DropDownFormFieldWidget(
          hintFontColor:hintFontColor  ,
          options: options, hint: hint,validator: validator,onChanged: onChanged,)
      ],
    );
  }
}
