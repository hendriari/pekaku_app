import 'package:flutter/material.dart';
import 'package:pekaku_app/helper/text_editing_controller.dart';
import 'package:pekaku_app/utils/colors.dart';
import 'package:pekaku_app/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:provider/provider.dart';

class SelectGenderWidget extends StatelessWidget {
  const SelectGenderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1, right: 15, left: 15, bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// garis atas
          SizedBox(
            width: 50,
            child: Divider(
              color: MyColor.dark,
              thickness: 2,
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          /// gender laki laki
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              TextEditing.jenisKelaminRegisterController.text = 'Laki - laki';
              context.read<NavigasiViewModel>().navigasiBack(context);
            },
            child: SizedBox(
              height: 40,
              child: Center(
                child: Text(
                  'Laki - Laki',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 5,
          ),

          Divider(
            color: MyColor.dark,
          ),

          const SizedBox(
            height: 5,
          ),

          /// gender perempuna
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              TextEditing.jenisKelaminRegisterController.text = 'Perempuan';
              context.read<NavigasiViewModel>().navigasiBack(context);
            },
            child: SizedBox(
              height: 40,
              child: Center(
                child: Text('Perempuan',
                    style: Theme.of(context).textTheme.headline6),
              ),
            ),
          ),

          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
