import 'package:bt_business/keys.dart';
import 'package:bt_business/presentation/form_validator/email_validator.dart';
import 'package:bt_business/presentation/form_validator/password_validator.dart';
import 'package:bt_business/presentation/route/router.dart';
import 'package:bt_business/presentation/route/router.gr.dart';
import 'package:bt_business/presentation/styling/dimension.dart';
import 'package:bt_business/presentation/styling/utils.dart';
import 'package:bt_business/presentation/widgets/buttons/cta_primary_button.dart';
import 'package:bt_business/presentation/widgets/forms/bt_input_text_field.dart';
import 'package:bt_business/presentation/widgets/forms/bt_password_field.dart';
import 'package:bt_business/presentation/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:bt_business/common/extensions/l10n_ext.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoginButtonPressed = false;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return InkWell(
      onDoubleTap: () {
        changeToggleThemeMode(context);
      },
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Form(
              key: _formKey,
              autovalidateMode: _isLoginButtonPressed
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: BTDimensions.standard,
                      vertical: BTDimensions.moreThanHuge,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          context.l10n.login,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        verticalSpacing(BTDimensions.moreThanHuge),
                        BTInputTextField(
                          key: BTKeys.LOGIN_USERNAME_INPUT,
                          labelText: l10n.emailOrUserNameLabelText,
                          validator: (value) => EmailFieldValidators.validateEmail(
                            value,
                            l10n.emailInvalidMessage,
                          ),
                        ),
                        //verticalSpacing(BTDimensions.huge),
                        BTPasswordField(
                          key: BTKeys.LOGIN_PASSWORD_INPUT,
                          labelText: l10n.passwordLabelText,
                          controller: _passwordController,
                          validator: (value) => PasswordFieldValidators.validatePasswordLogin(
                            value,
                            l10n.emptyPasswordMessage,
                          ),
                        ),
                        verticalSpacing(BTDimensions.standardAndMore),
                        Text(
                          context.l10n.forgot,
                          style: Theme.of(context).textTheme.overline,
                        ),
                        verticalSpacing(BTDimensions.huge),
                        CTAPrimaryButton(
                          key: BTKeys.LOGIN_ACTION_BUTTON,
                          text: l10n.login,
                          onPressed: () => _onLoginPressed(context),
                        ),
                        verticalSpacing(BTDimensions.standardAndMore),
                        _RegisterWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginPressed(BuildContext context) async {
    setState(() {
      _isLoginButtonPressed = true;
    });
    hideKeyboard();
    if (_formKey.currentState?.validate() == true) {
      FocusScope.of(context).unfocus();
      final userName = _usernameController.text.toLowerCase().trim();
      final password = _passwordController.text;
      router.push(const SecurityCheckRoute());
    }
  }
}

class _RegisterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.notYetSetUp,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(l10n.register, style: Theme.of(context).textTheme.overline),
      ],
    );
  }
}
