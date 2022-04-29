import 'package:configuration/utility/logging.dart';
import 'package:configuration/utility/string_utils.dart';
import 'package:logger/logger.dart';

enum Flavor { DEVELOPMENT, PRODUCTION }

class BuildConfig {
  BuildConfig._({
    required this.base,
    required this.eeBase,
    required this.eeBaseSIPG,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.flavor,
  }) {
    Log.info(
        "Environment",
        '\nBuild Flavor:      $flavor\n'
            'BaseUrl:           $base\n'
            'EEBase:            $eeBase\n'
            'EEBaseSIPG:        $eeBaseSIPG\n'
            'ConnectTimeout:    $connectTimeout\n'
            'ReceiveTimeout:    $receiveTimeout\n');
  }

  BuildConfig._modelA()
      : this._(
          base: 'https://eric1-dmze2e-ukb.bt.com',
          eeBase: 'https://api-test1.ee.co.uk/',
          eeBaseSIPG: 'https://sipg-cust-test.secure.bt.com',
          connectTimeout: 30000,
          // 30 seconds
          receiveTimeout: 30000,
          // 30 seconds
          flavor: Flavor.DEVELOPMENT,
        );

  BuildConfig._production()
      : this._(
          base: 'https://secure.business.bt.com',
          eeBase: 'https://api.ee.co.uk/',
          eeBaseSIPG: 'https://sipg.secure.bt.com',
          connectTimeout: 10000,
          // 10 seconds
          receiveTimeout: 10000,
          // 10 seconds
          flavor: Flavor.PRODUCTION,
        );

  static BuildConfig? _instance;

  static init({flavor}) {
    switch (flavor) {
      case 'development':
        _instance = BuildConfig._modelA();
        break;
      case 'production':
        _instance = BuildConfig._production();
        break;
      default:
        _instance = BuildConfig._modelA();
        break;
    }
    _iniLog(flavor);
  }

  static BuildConfig get() {
    assert(_instance != null);
    return _instance!;
  }

  static _iniLog(flavor) async {
    switch (_instance?.flavor) {
      case Flavor.DEVELOPMENT:
      case Flavor.PRODUCTION:
        Log.setLevel(Level.nothing);
        break;
      default:
        break;
    }
  }

  final String base;
  final String eeBase;
  final String eeBaseSIPG;
  final int connectTimeout;
  final int receiveTimeout;

  final Flavor flavor;

  static String flavorName() => (_instance?.flavor.toString() ?? "").enumToName();

  static bool isProduct() => _instance?.flavor == Flavor.PRODUCTION;

  static bool isDevelopment() => _instance?.flavor == Flavor.DEVELOPMENT;
}
