import 'package:express_link/constants/colors.dart';
import 'package:flutter/material.dart';

Future<dynamic> showAlertMessege(
  BuildContext context, {
  required String message,
  String? title,
  Function? onOKTap,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title ?? 'Alert Message',
          style: const TextStyle(color: KColors.tileText),
        ),
        content: Text(
          message,
          style: const TextStyle(color: KColors.descriptionText),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Center(
                  child: Text('Cancel'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (onOKTap != null) {
                    onOKTap();
                  }
                },
                child: const Center(
                  child: Text('Continue'),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
