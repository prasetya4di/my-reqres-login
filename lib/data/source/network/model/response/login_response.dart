import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginResponse {
  final String token;

  LoginResponse(this.token);
}
