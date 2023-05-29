import 'package:chopper/chopper.dart';
import 'package:my_reqres_login/data/source/network/model/response/user_response.dart';

part 'user_service.chopper.dart';

@ChopperApi(baseUrl: "/users")
abstract class UserService extends ChopperService {
  static UserService create([ChopperClient? client]) => _$UserService(client);

  @Get(path: "/{user_id}")
  Future<Response<UserResponse>> getUser(@Path("user_id") int userId);
}
