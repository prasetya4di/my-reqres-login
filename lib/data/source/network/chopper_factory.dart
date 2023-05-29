import 'package:chopper/chopper.dart';
import 'package:my_reqres_login/data/source/network/response_converter.dart';
import 'package:my_reqres_login/data/source/network/service/user_service.dart';

class ChopperFactory {
  late final ChopperClient client;

  ChopperFactory._create(this.client) {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static ChopperClient create() => ChopperClient(
    baseUrl: Uri.parse("https://reqres.in/api"),
        converter: ResponseConverter(),
        errorConverter: ResponseConverter(),
        services: [UserService.create()],
      );
}
