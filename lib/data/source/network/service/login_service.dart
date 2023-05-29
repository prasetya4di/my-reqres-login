import 'package:chopper/chopper.dart';
import 'package:my_reqres_login/data/source/network/model/request/login_request.dart';
import 'package:my_reqres_login/data/source/network/model/response/login_response.dart';

part 'login_service.chopper.dart';

@ChopperApi(baseUrl: "/login")
abstract class LoginService extends ChopperService {
  static LoginService create([ChopperClient? client]) => _$LoginService(client);

  @Post()
  Future<Response<LoginResponse>> login(@Body() LoginRequest loginRequest);
}
