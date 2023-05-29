import 'package:either_dart/either.dart';
import 'package:my_reqres_login/data/source/network/model/response/error_response.dart';
import 'package:my_reqres_login/domain/entities/user.dart';

abstract class GetUser {
  Future<Either<ErrorResponse, User>> call(String email);
}
