import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/register_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


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
            )
          ),
          child: CupertinoDatePicker(
            use24hFormat: true,
            mode: CupertinoDatePickerMode.date,
            maximumYear: 2022,
            onDateTimeChanged: (DateTime newDate) {
              context
                  .read<RegisterViewModel>()
                  .registerTanggalLahirController
                  .text = newDate.toString();

              context
                  .read<RegisterViewModel>()
                  .registerTanggalLahirController
                  .text = DateFormat('d MMMM y').format(newDate);

            },
          ),
        );
      });
}
