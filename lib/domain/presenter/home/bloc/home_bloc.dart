import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_reqres_login/data/source/network/model/response/error_response.dart';
import 'package:my_reqres_login/domain/presenter/home/bloc/home_state.dart';
import 'package:my_reqres_login/domain/usecase/get_user.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUser _getUser;

  HomeBloc(this._getUser) : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        onGetUser: (email) async {
          await _getUser(email)
              .onError((error, stackTrace) => Left(ErrorResponse("Error")))
              .then(
                (value) => value.fold(
                  (fail) => emit(HomeState.error(fail.error)),
                  (data) => emit(HomeState.success(data)),
                ),
              );
        },
      );
    });
  }
}
