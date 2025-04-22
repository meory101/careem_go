import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:careem_go/core/helper/date_time_helper.dart';
import '../../helper/language_helper.dart';
import '../../resource/color_manager.dart';
import '../../resource/font_manager.dart';
import '../../resource/icon_manager.dart';
import '../../resource/size_manager.dart';
import '../bottom_sheet/wheel_date_picker.dart';
import '../text/app_text_widget.dart';

class TitleCalendarFormField extends StatefulWidget {
  final String title;
  final String hint;
  final Function(DateTime) onDateChanged;
 final Color? color;

  const TitleCalendarFormField({
    super.key,
    required this.title,
    required this.onDateChanged,
    required this.hint,
    this.color
  });

  @override
  State<TitleCalendarFormField> createState() => _TitleCalendarFormFieldState();
}

class _TitleCalendarFormFieldState extends State<TitleCalendarFormField> {
  DateTime? selectedData;

  showDateWheel() {
    final now = DateTime.now();
    final eighteenYearsAgo = DateTime(now.year - 18, now.month, now.day);

    showWheelDatePicker(
      context: context,
      onDateSelected: (date) {
        selectedData = date;
        setState(() {});
        widget.onDateChanged(date);
      },
      maximumDate: eighteenYearsAgo,
      minimumDate: DateTime(1900),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextWidget(
          text: widget.title,
          fontSize: FontSizeManager.fs16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: AppHeightManager.h1),
        InkWell(
          overlayColor:
              const WidgetStatePropertyAll(AppColorManager.transparent),
          onTap: () => showDateWheel(),
          child: Container(
            alignment: LanguageHelper.checkIfLTR(context: context)
                ? Alignment.topRight
                : Alignment.topLeft,
            width: double.infinity,
            height: AppHeightManager.h6,
            decoration: BoxDecoration(
              color: AppColorManager.white,
              borderRadius:
                  BorderRadius.all(Radius.circular(AppRadiusManager.r10)),
              border: Border.all(color: AppColorManager.lightGreyOpacity6),
            ),
            child: Padding(
              padding: EdgeInsets.all(AppWidthManager.w3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTextWidget(
                    text: selectedData != null
                        ? DateTimeHelper.formatDateWithDash(date: selectedData)
                        : widget.hint,
                    fontSize: FontSizeManager.fs15,
                    fontWeight: FontWeight.w500,
                    color:widget.color ?? (selectedData != null
                        ? AppColorManager.textAppColor
                        : AppColorManager.hintGrey),
                  ),
                  InkWell(
                    overlayColor: const WidgetStatePropertyAll(
                        AppColorManager.transparent),
                    onTap: () => showDateWheel(),
                    child: SvgPicture.asset(AppIconManager.calendar),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
    