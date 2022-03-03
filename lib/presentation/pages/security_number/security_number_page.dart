import 'package:bt_business/keys.dart';
import 'package:bt_business/presentation/form_validator/confirmation_code_validator.dart';
import 'package:bt_business/presentation/route/router.dart';
import 'package:bt_business/presentation/styling/dimension.dart';
import 'package:bt_business/presentation/styling/utils.dart';
import 'package:bt_business/presentation/widgets/bt_header.dart';
import 'package:bt_business/presentation/widgets/buttons/cta_primary_button.dart';
import 'package:bt_business/presentation/widgets/forms/bt_input_text_field.dart';
import 'package:bt_business/presentation/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:bt_business/common/extensions/l10n_ext.dart';

class SecurityNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return InkWell(
      onTap: hideKeyboard,
      onDoubleTap: () {
        changeToggleThemeMode(context);
      },
      child: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  BTHeader(
                    title: l10n.securityNumberHeader,
                    onBackPressed: () {
                      router.navigateBack();
                    },
                  ),
                  _SecurityNumberPage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SecurityNumberPage extends StatefulWidget {
  @override
  State<_SecurityNumberPage> createState() => _SecurityNumberPageState();
}

class _SecurityNumberPageState extends State<_SecurityNumberPage> {
  final _formKey = GlobalKey<FormState>();
  final _securityNumberController = TextEditingController();
  final _securityNumberConfirmController = TextEditingController();
  bool _isConfirmButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Form(
      key: _formKey,
      autovalidateMode:
          _isConfirmButtonPressed ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: BTDimensions.standard,
          vertical: BTDimensions.veryBig,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.securityNumberTitle,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            verticalSpacing(BTDimensions.veryBig),
            Text(
              l10n.securityNumberDescription,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            verticalSpacing(BTDimensions.huge),
            Text(
              l10n.pleaseEnterSecurityNumber,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            verticalSpacing(BTDimensions.normal),
            _SecurityNumberInputWidget(
              key: BTKeys.SECURITY_NUMBER_INPUT,
              controller: _securityNumberController,
              validator: (value) => CodeFieldValidators.securityNumberValidator(
                value,
                l10n.emptySecurityNumber,
              ),
            ),
            Text(
              l10n.pleaseConfirmSecurityNumber,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            verticalSpacing(BTDimensions.normal),
            _SecurityNumberInputWidget(
              key: BTKeys.SECURITY_NUMBER_CONFIRM_INPUT,
              controller: _securityNumberConfirmController,
              validator: (value) => CodeFieldValidators.securityNumberMatchValidator(
                code: _securityNumberController.text,
                confirmCode: value,
                errorMessage: l10n.securityNumberMatchError,
              ),
            ),
            verticalSpacing(BTDimensions.small),
            CTAPrimaryButton(
              key: BTKeys.SECURITY_NUMBER_ACTION_BUTTON,
              text: l10n.confirmButton,
              onPressed: () => _onConfirmPressed(context),
            ),
          ],
        ),
      ),
    );
  }

  void _onConfirmPressed(BuildContext context) async {
    setState(() {
      _isConfirmButtonPressed = true;
    });
    hideKeyboard();
    if (_formKey.currentState?.validate() == true) {
      FocusScope.of(context).unfocus();
      final userName = _securityNumberController.text.toLowerCase().trim();
      final password = _securityNumberConfirmController.text;
    }
  }
}

class _SecurityNumberInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const _SecurityNumberInputWidget({
    Key? key,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BTInputTextField(
          textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                letterSpacing: BTDimensions.textSizeMoreThanTiny,
              ),
          inputType: TextInputType.number,
          validator: validator,
          mask: [securityNumberMaskFormatter],
          controller: controller,
        ),
        Positioned(
          left: 18,
          bottom: BTDimensions.huge,
          child: Text(
            '__   __   __   __   __   __   __   __',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
