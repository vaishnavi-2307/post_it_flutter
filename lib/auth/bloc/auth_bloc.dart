import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_it/core/service/api_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiService _apiService;

  AuthBloc(this._apiService) : super(AuthState.initial()) {
    on<AuthStartEvent>(_authenticate);
  }

  Future<void> _authenticate(AuthEvent event, Emitter<AuthState> emit) async {
    final successOrFailure = await _apiService.getAccessToken();

    successOrFailure.fold(
      (l) => emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Authentication failed',
      )),
      (r) => emit(state.copyWith(
        status: AuthStatus.success,
      )),
    );
  }
}
