import 'package:firebase_task/Constant/MyColors.dart';
import 'package:firebase_task/core/Blocs/Home/home_page_cubit.dart';
import 'package:firebase_task/core/Models/WeightModel.dart';
import 'package:flutter/material.dart';

import 'delete_dialog.dart';

class WeightItem extends StatelessWidget {
  final WeightModel item;

  const WeightItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HomePageCubit.get(context).selectWeight(selected: item);
      },
      onLongPress: () async {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return DeletedDialog(
                delete: () {
                  HomePageCubit.get(context).deleteWeight(model: item);
                  Navigator.of(context).pop();
                },
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 28,
                decoration: BoxDecoration(
                    color: MyColors.myLiteBlue,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    maxLines: 1,
                    '${item.weight}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Expanded(
                flex: 2,
                child: Text(
                  '${item.date}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
