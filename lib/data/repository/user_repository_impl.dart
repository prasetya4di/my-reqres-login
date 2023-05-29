import 'package:chopper/src/response.dart';
import 'package:my_reqres_login/data/source/network/model/request/login_request.dart';
import 'package:my_reqres_login/data/source/network/model/response/login_response.dart';
import 'package:my_reqres_login/data/source/network/model/response/user_response.dart';
import 'package:my_reqres_login/data/source/network/service/login_service.dart';
import 'package:my_reqres_login/data/source/network/service/user_service.dart';
import 'package:my_reqres_login/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final LoginService _loginService;
  final UserService _userService;

  UserRepositoryImpl(this._loginService, this._userService);

  @override
  Future<Response<UserResponse>> getUser() async =>
      await _userService.getUser(2);

  @override
  Future<Response<LoginResponse>> login(LoginRequest request) async =>
      await _loginService.login(request);
}
