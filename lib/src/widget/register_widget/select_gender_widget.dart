import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/register_provider.dart';
import 'package:pekaku_app/src/view_model/navigator_view_model/navigator_provider.dart';
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
          Consumer<RegisterViewModel>(builder: (context, value, child) {
            return InkWell(
              onTap: () {
                value.registerJenisKelaminLahirController.text = 'Laki - laki';
                context.read<NavigatorProvider>().navigasiBack(context);
              },
              child: SizedBox(
                height: 20,
                child: Text(
                  'Laki - Laki',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            );
          }),
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
          Consumer<RegisterViewModel>(builder: (context, value, child) {
            return InkWell(
              onTap: () {
                value.registerJenisKelaminLahirController.text = 'Perempuan';
                context.read<NavigatorProvider>().navigasiBack(context);
              },
              child: SizedBox(
                height: 20,
                child: Text('Perempuan',
                    style: Theme.of(context).textTheme.headline6),
              ),
            );
          }),

          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
