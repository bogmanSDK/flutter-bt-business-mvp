import 'package:flutter/widgets.dart';
import 'package:bt_business/generated/l10n.dart';

extension AppLocalizationExtentions on BuildContext {
  S get l10n => S.of(this);
}
