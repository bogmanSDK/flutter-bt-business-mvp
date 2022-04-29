
import 'package:bt_business/di/module/api_module.dart';
import 'package:bt_business/di/module/bloc_module.dart';
import 'package:bt_business/di/module/components_module.dart';
import 'package:bt_business/di/module/repo_module.dart';

class Injection {
  static Future inject() async {
    await ComponentsModule().provides();
    await ApiModule().provides();
    await RepositoryModule().provides();
    await BlocModule().provides();
  }
}
