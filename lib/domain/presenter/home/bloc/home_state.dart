import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_reqres_login/domain/entities/user.dart';

part 'home_state.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.onGetUser(String email) = GetUserEvent;
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitialState;

  const factory HomeState.loading() = HomeLoadingState;

  const factory HomeState.error(String message) = HomeErrorState;

  const factory HomeState.success(User user) = HomeSuccessState;
}
