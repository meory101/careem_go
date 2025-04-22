import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:careem_go/core/resource/color_manager.dart';
import 'package:careem_go/core/resource/font_manager.dart';
import 'package:careem_go/core/resource/size_manager.dart';
import 'package:careem_go/core/widget/button/main_app_button.dart';
import 'package:careem_go/core/widget/text/app_text_widget.dart';

void showWheelDatePicker({
  required BuildContext context,
  DateTime? initialDateTime,
  DateTime? minimumDate,
  DateTime? maximumDate,
  required Function(DateTime) onDateSelected,
}) {
  final now = DateTime.now();
  final eighteenYearsAgo = DateTime(now.year - 18, now.month, now.day);

  // نحدد الحد الأعلى والحد الأدنى
  final DateTime minDate = minimumDate ?? DateTime(1900);
  final DateTime maxDate = maximumDate ?? eighteenYearsAgo;

  // نضبط التاريخ المبدئي حسب الحدود
  final DateTime initial = () {
    if (initialDateTime != null) {
      if (initialDateTime.isBefore(minDate)) return minDate;
      if (initialDateTime.isAfter(maxDate)) return maxDate;
      return initialDateTime;
    } else {
      return maxDate;
    }
  }();

  DateTime selectedDate = initial;

  showModalBottomSheet(
    context: context,
    backgroundColor: AppColorManager.white,
    builder: (BuildContext builder) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadiusManager.r10),
          color: AppColorManager.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              height: AppHeightManager.h30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                color: AppColorManager.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w5),
                child: CupertinoDatePicker(
                  initialDateTime: initial,
                  onDateTimeChanged: (DateTime pickedDate) {
                    selectedDate = pickedDate;
                  },
                  itemExtent: AppHeightManager.h5,
                  mode: CupertinoDatePickerMode.date,
                  minimumDate: minDate,
                  maximumDate: maxDate,
                  use24hFormat: true,
                ),
              ),
            ),
            SizedBox(height: AppHeightManager.h2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainAppButton(
                  width: MediaQuery.of(context).size.width / 2.6,
                  borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                  height: AppHeightManager.h5,
                  onTap: () {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd', 'en_US').format(selectedDate);
                    DateTime finalDate = DateTime.parse(formattedDate);
                    onDateSelected(finalDate);
                    Navigator.of(context).pop();
                  },
                  color: AppColorManager.mainColor,
                  alignment: Alignment.center,
                  child: AppTextWidget(
                    text: "save".tr(),
                    fontSize: FontSizeManager.fs16,
                    color: AppColorManager.white,
                  ),
                ),
                SizedBox(width: AppWidthManager.w2),
                MainAppButton(
                  width: MediaQuery.of(context).size.width / 2.6,
                  borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                  height: AppHeightManager.h5,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  color: AppColorManager.white,
                  alignment: Alignment.center,
                  child: AppTextWidget(
                    text: "cancel".tr(),
                    fontSize: FontSizeManager.fs16,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppHeightManager.h2),
          ],
        ),
      );
    },
  );
}
                                                                                                      