import 'package:flutter/cupertino.dart';

class CustomDialog{

  static void showCupertinoAlertDialog(BuildContext context, {required String title,required String subtitle}){
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: [
              CupertinoButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        },
      );
  }
}