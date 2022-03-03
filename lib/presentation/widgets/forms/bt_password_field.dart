import 'package:bt_business/data/models/password_constraint/password_validation_constraints.dart';
import 'package:bt_business/presentation/form_validator/password_validator.dart';
import 'package:bt_business/presentation/styling/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef PasswordValidationListener = Function(PasswordConstraintModel);

class BTPasswordField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final List<TextInputFormatter>? mask;
  final TextEditingController controller;
  final PasswordValidationListener? validationListener;
  final FormFieldValidator<String>? validator;

  const BTPasswordField({
    Key? key,
    this.labelText,
    this.mask,
    this.hintText,
    required this.controller,
    this.validationListener,
    this.validator,
  }) : super(key: key);

  @override
  State<BTPasswordField> createState() => _BTPasswordFieldState();
}

class _BTPasswordFieldState extends State<BTPasswordField> {
  bool isVisible = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        isVisible = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      child: isVisible
          ? SizedBox(
              child: TextFormField(
                controller: widget.controller,
                validator: widget.validator,
                onChanged: _validateOnChange,
                keyboardType: TextInputType.text,
                style: Theme.of(context).textTheme.bodyText1,
                inputFormatters: widget.mask,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(BTDimensions.normal),
                  labelText: widget.labelText,
                  hintText: widget.hintText,
                ),
              ),
            )
          : Opacity(
            opacity: 0,
            child: SizedBox(
        child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            onChanged: _validateOnChange,
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.bodyText1,
            inputFormatters: widget.mask,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(BTDimensions.normal),
              labelText: widget.labelText,
              hintText: widget.hintText,
            ),
        ),
      ),
          ),
    );
  }

  void _validateOnChange(String pass) {
    if (widget.validationListener != null) {
      widget.validationListener!(PasswordFieldValidators.getValidationState(pass));
    }
  }
}
