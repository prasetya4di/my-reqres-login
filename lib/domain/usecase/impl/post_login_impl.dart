import 'package:either_dart/either.dart';
import 'package:my_reqres_login/data/source/network/model/request/login_request.dart';
import 'package:my_reqres_login/data/source/network/model/response/error_response.dart';
import 'package:my_reqres_login/domain/repository/user_repository.dart';
import 'package:my_reqres_login/domain/usecase/post_login.dart';

class PostLoginImpl implements PostLogin {
  final UserRepository _repository;

  PostLoginImpl(this._repository);

  @override
  Future<Either<ErrorResponse, String>> call(
      String email, String password) async {
    final response = await _repository.login(LoginRequest(email, password));
    if (response.body != null) {
      return Right(response.body!.token);
    } else {
      return Left(response.error as ErrorResponse);
    }
  }
}
