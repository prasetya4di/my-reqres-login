import 'package:json_annotation/json_annotation.dart';
import 'package:my_reqres_login/data/source/network/model/response/user_data_response.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final UserDataResponse data;

  UserResponse(this.data);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
