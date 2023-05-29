import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.onLogin(String email, String password) =
      PostLoginEvent;
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitialState;

  const factory LoginState.loading() = LoginLoadingState;

  const factory LoginState.error(String message) = LoginErrorState;

  const factory LoginState.success(String email) = LoginSuccessState;
}
