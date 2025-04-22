import 'package:flutter/material.dart';
import '../../resource/font_manager.dart';
import '../../resource/size_manager.dart';
import '../text/app_text_widget.dart';
import '../text/required_text_widget.dart';
import 'app_form_field.dart';

class TitleAppFormFiled extends StatelessWidget {
  const TitleAppFormFiled(
      {super.key,
      required this.hint,
      required this.title,
      required this.onChanged,
      required this.validator,
      this.initValue,
      this.style,
      this.onTap,
      this.suffixIcon,
      this.onIconTaped,
      this.maxLines,
      this.minLines,
      this.isRequired,
      this.readOnly,
      this.multiLines,
      this.textInputType,
      this.hintTextDirection,
      this.controller,
      this.textDirection,
      this.obscureText,
      this.formKey});

  final String title, hint;
  final String? Function(String?) onChanged;
  final String? Function(String?) validator;
  final String? initValue;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final bool? readOnly;
  final bool? multiLines;
  final bool? obscureText;
  final TextStyle? style;
  final Function()? onIconTaped;
  final bool? isRequired;
  final int? maxLines;
  final int? minLines;
  final TextEditingController? controller;
  final GlobalKey<FormState>? formKey;
  final TextInputType? textInputType;
  final TextDirection? hintTextDirection;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isRequired != null
            ? RequiredTextWidget(title: title)
            : AppTextWidget(
                text: title,
                fontSize: FontSizeManager.fs16,
                fontWeight: FontWeight.w600,
              ),
        SizedBox(
          height: AppHeightManager.h1point5,
        ),
        SizedBox(
          child: AppTextFormField(
            onTap: onTap,
            hintTextDirection: hintTextDirection,
            controller: controller,
            style: style,
            readOnly: readOnly,
            suffixIcon: suffixIcon,
            initialValue: initValue,
            minLines: multiLines == true ? minLines ?? 5 : 1,
            maxLines: maxLines,
            obscureText: obscureText,
            validator: validator,
            onChanged: onChanged,
            textInputAction: TextInputAction.done,
            hintText: hint,
            textInputType: textInputType,
            textDirection: textDirection,
          ),
        ),
      ],
    );
  }
}
