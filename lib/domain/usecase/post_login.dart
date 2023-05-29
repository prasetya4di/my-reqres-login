import 'package:either_dart/either.dart';
import 'package:my_reqres_login/data/source/network/model/response/error_response.dart';

abstract class PostLogin {
  Future<Either<ErrorResponse, String>> call(String email, String password);
}
