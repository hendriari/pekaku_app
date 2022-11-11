import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/helper/text_editing_controller.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:intl/intl.dart';

Future profileBirthDayPicker(context) {
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
              TextEditing.tanggalLahirUpdateProfileController.text =
                  newDate.toString();

              TextEditing.tanggalLahirUpdateProfileController.text =
                  DateFormat('d MMMM y').format(newDate);
            },
          ),
        );
      });
}
