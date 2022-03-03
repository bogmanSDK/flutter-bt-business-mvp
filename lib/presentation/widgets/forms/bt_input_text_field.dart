import 'package:bt_business/presentation/styling/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BTInputTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final List<TextInputFormatter>? mask;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool isEnabled;
  final int minLines;
  final int maxLines;
  final TextInputType? inputType;
  final Function(String value)? onChanged;
  final TextStyle? textStyle;

  const BTInputTextField({
    Key? key,
    this.labelText,
    this.mask,
    this.hintText,
    this.isEnabled = true,
    this.minLines = 1,
    this.maxLines = 1,
    this.validator,
    this.controller,
    this.inputType,
    this.onChanged,
    this.textStyle,
  }) : super(key: key);

  @override
  State<BTInputTextField> createState() => _BTInputTextFieldState();
}

class _BTInputTextFieldState extends State<BTInputTextField> {
  bool isVisible = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 30), () {
      setState(() {
        isVisible = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 700),
      //transitionBuilder: ,
      child: isVisible
          ? SizedBox(
              height: BTDimensions.godzilla,
              child: TextFormField(
                controller: widget.controller,
                validator: widget.validator,
                keyboardType: widget.inputType,
                onChanged: widget.onChanged,
                style: widget.textStyle ?? Theme.of(context).textTheme.bodyText1,
                inputFormatters: widget.mask,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(BTDimensions.normal),
                  labelText: widget.labelText,
                  hintText: widget.hintText,
                ),
              ),
            )
          : Container(
              color: Colors.transparent,
              width: double.infinity,
              height: BTDimensions.godzilla,
            ),
    );
  }
}
