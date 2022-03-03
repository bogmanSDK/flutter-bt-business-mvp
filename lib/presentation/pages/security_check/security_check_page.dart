import 'package:bt_business/keys.dart';
import 'package:bt_business/presentation/form_validator/password_validator.dart';
import 'package:bt_business/presentation/route/router.dart';
import 'package:bt_business/presentation/route/router.gr.dart';
import 'package:bt_business/presentation/styling/dimension.dart';
import 'package:bt_business/presentation/styling/utils.dart';
import 'package:bt_business/presentation/widgets/bt_header.dart';
import 'package:bt_business/presentation/widgets/buttons/cta_primary_button.dart';
import 'package:bt_business/presentation/widgets/buttons/outline_primary_button.dart';
import 'package:bt_business/presentation/widgets/forms/bt_input_text_field.dart';
import 'package:bt_business/presentation/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:bt_business/common/extensions/l10n_ext.dart';

class SecurityCheckPage extends StatelessWidget {
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
                    title: l10n.securityCheckHeader,
                    onBackPressed: () {
                      router.navigateBack();
                    },
                  ),
                  _SecurityCheckBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SecurityCheckBody extends StatefulWidget {
  @override
  State<_SecurityCheckBody> createState() => _SecurityCheckBodyState();
}

class _SecurityCheckBodyState extends State<_SecurityCheckBody> {
  final _formKey = GlobalKey<FormState>();
  final _securityPinController = TextEditingController();
  bool _isNextButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: BTDimensions.standard,
        vertical: BTDimensions.veryBig,
      ),
      child: Form(
        key: _formKey,
        autovalidateMode:
            _isNextButtonPressed ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.securityCheckTitle,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            verticalSpacing(BTDimensions.veryBig),
            Text(
              context.l10n.securityCheckDescription,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            verticalSpacing(BTDimensions.huge),
            Text(
              context.l10n.oneOffCode,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            verticalSpacing(BTDimensions.normal),
            BTInputTextField(
              key: BTKeys.SECURITY_ONE_OFF_CODE_INPUT,
              controller: _securityPinController,
              inputType: TextInputType.number,
              mask: [oneOffCodeMaskFormatter],
              validator: (value) => PasswordFieldValidators.validatePasswordLogin(
                value,
                l10n.emptySecurityPinMessage,
              ),
            ),
            //verticalSpacing(BTDimensions.huge),
            CTAPrimaryButton(
              key: BTKeys.SECURITY_CHECK_NEXT_BUTTON,
              text: l10n.nextButton,
              onPressed: () {
                _onNextPressed(context);
              },
            ),
            verticalSpacing(BTDimensions.medium),
            OutlinePrimaryButton(
              key: BTKeys.SECURITY_CHECK_CANCEL_BUTTON,
              text: l10n.cancelButton,
              onPressed: () {
                router.navigateBack();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onNextPressed(BuildContext context) async {
    setState(() {
      _isNextButtonPressed = true;
    });
    hideKeyboard();
    if (_formKey.currentState?.validate() == true) {
      FocusScope.of(context).unfocus();
      final securityPin = _securityPinController.text.toLowerCase().trim();
      router.push(const SecurityNumberRoute());
    }
  }
}
