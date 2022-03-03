import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bt_business/presentation/styling/dimension.dart';
import 'package:bt_business/presentation/styling/utils.dart';
import 'package:flutter/material.dart';

class OutlinePrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OutlinePrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeModeNotifier(context),
      builder: (_, mode, child) {
        // update your UI
        return SizedBox(
          height: BTDimensions.veryBig,
          width: double.infinity,
          child: OutlinedButton(
            style: primaryOutlineButtonStyle(themeMode(mode)),
            onPressed: onPressed,
            child: Text(text),
          ),
        );
      },
    );
  }
}
