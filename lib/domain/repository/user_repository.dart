import 'package:chopper/chopper.dart';
import 'package:my_reqres_login/data/source/network/model/request/login_request.dart';
import 'package:my_reqres_login/data/source/network/model/response/login_response.dart';
import 'package:my_reqres_login/data/source/network/model/response/user_response.dart';

abstract class UserRepository {
  Future<Response<LoginResponse>> login(LoginRequest request);

  Future<Response<UserResponse>> getUser();
}
