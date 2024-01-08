import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class ThirdPartyInjection {
  @singleton
  Dio get dio => Dio();
  // @singleton
  // @lazySingleton
  // InternetConnectionChecker get internetConnectionChecker =>
  //     InternetConnectionChecker();
}
