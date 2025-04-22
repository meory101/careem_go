import 'package:flutter/material.dart';
import 'package:careem_go/core/resource/font_manager.dart';
import 'package:careem_go/core/resource/size_manager.dart';
import 'package:careem_go/core/widget/text/app_text_widget.dart';

class StatusText extends StatelessWidget {
  const StatusText({super.key, required this.color, required this.text});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.symmetric(
          horizontal: AppWidthManager.w3Point8, vertical: AppHeightManager.h1),
      child: AppTextWidget(
        text: text,
        fontSize: FontSizeManager.fs14,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}