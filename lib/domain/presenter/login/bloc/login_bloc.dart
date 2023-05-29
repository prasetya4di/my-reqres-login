import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_reqres_login/data/source/network/model/response/error_response.dart';
import 'package:my_reqres_login/domain/presenter/login/bloc/login_state.dart';
import 'package:my_reqres_login/domain/usecase/post_login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PostLogin _postLogin;

  LoginBloc(this._postLogin) : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(onLogin: (email, password) async {
        emit(const LoginState.loading());
        await _postLogin(email, password)
            .onError((error, stackTrace) => Left(ErrorResponse("Error")))
            .then(
              (value) => value.fold(
                (fail) => emit(LoginState.error(fail.error)),
                (data) => emit(LoginState.success(email)),
              ),
            );
      });
    });
  }
}
