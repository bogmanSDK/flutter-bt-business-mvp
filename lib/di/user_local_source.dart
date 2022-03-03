import 'package:bt_business/data/data_sources/local/user/user_local_source.dart';
import 'package:bt_business/data/data_sources/local/user/user_local_source_impl.dart';
import 'package:get_it/get_it.dart';

void registerUserLocalSource() => GetIt.I.registerSingleton<UserLocalSource>(
      UserLocalSourceImpl(),
    );

UserLocalSource getUserLocalSource() => GetIt.I.get<UserLocalSource>();
