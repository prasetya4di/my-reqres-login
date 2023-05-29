import 'package:either_dart/either.dart';
import 'package:my_reqres_login/data/source/network/model/response/error_response.dart';
import 'package:my_reqres_login/domain/entities/user.dart';
import 'package:my_reqres_login/domain/repository/user_repository.dart';
import 'package:my_reqres_login/domain/usecase/get_user.dart';

class GetUserImpl implements GetUser {
  final UserRepository _repository;

  GetUserImpl(this._repository);

  @override
  Future<Either<ErrorResponse, User>> call(String email) async {
    final response = await _repository.getUser();

    if (response.body != null) {
      final data =
          response.body!.data.firstWhere((user) => user.email == email);
      return Right(User(
        data.id,
        data.email,
        data.firstName,
        data.lastName,
        data.avatar,
      ));
    } else {
      return Left(response.error as ErrorResponse);
    }
  }
}
