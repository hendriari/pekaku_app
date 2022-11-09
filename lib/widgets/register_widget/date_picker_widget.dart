import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/helper/text_editing_controller.dart';
import 'package:intl/intl.dart';
import 'package:pekaku_app/utils/colors.dart';

Future birthDayPicker(context) {
  return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          decoration: BoxDecoration(
              color: MyColor.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
          child: CupertinoDatePicker(
            use24hFormat: true,
            mode: CupertinoDatePickerMode.date,
            maximumYear: 2022,
            onDateTimeChanged: (DateTime newDate) {
              TextEditing.tanggalLahirRegisterController.text =
                  newDate.toString();

              TextEditing.tanggalLahirRegisterController.text =
                  DateFormat('d MMMM y').format(newDate);
            },
          ),
        );
      });
}
