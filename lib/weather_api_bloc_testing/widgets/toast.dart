import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/enum/status.dart';

toastInfo({
  required String msg,
  required Status status,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: status == Status.success ? Colors.green : Colors.red,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
  );
}
