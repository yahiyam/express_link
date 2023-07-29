import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColors.button,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            color: KColors.buttonText,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
