import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

Future kCoolAlert({
  required String message,
  required BuildContext context,
  required CoolAlertType alert,
  Function? action,
  barrierDismissible = true,
  confirmBtnText = 'Ok',
}) {
  return CoolAlert.show(
    backgroundColor: Colors.grey,
    confirmBtnColor: Colors.brown,
    context: context,
    type: alert,
    text: message,
    barrierDismissible: barrierDismissible,
    confirmBtnText: confirmBtnText,
  );
}
