
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Constant/MyColors.dart';

class MyToast{
  static myToastShow(String text, Color color){
    Fluttertoast.showToast(
        msg: text,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: MyColors.myWhite,
        fontSize: 16.0);
  }
}