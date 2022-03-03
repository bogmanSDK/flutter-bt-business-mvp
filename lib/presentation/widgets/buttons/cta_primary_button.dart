import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bt_business/presentation/styling/dimension.dart';
import 'package:bt_business/presentation/styling/utils.dart';
import 'package:flutter/material.dart';

class CTAPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CTAPrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeModeNotifier(context),
      builder: (_, mode, __) {
        return SizedBox(
          height: BTDimensions.veryBig,
          width: double.infinity,
          child: ElevatedButton(
            style: primaryCTAButtonStyle(themeMode(mode)),
            onPressed: onPressed,
            child: Text(text),
          ),
        );
      },
    );
  }
}
