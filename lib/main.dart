import 'application.dart';

void main() => DevEnvironment();

class DevEnvironment extends Application {
  @override
  bool get isDevelop => true;
}
