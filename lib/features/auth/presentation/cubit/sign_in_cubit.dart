import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc_starter/core/error/app_exception.dart';
import 'package:flutter_grpc_starter/features/auth/domain/auth_repository.dart';

part 'sign_in_state.dart';

final class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this._authRepository}) : super(const .new());

  final AuthRepository _authRepository;

  Future<void> submit({required String email, required String password}) async {
    if (state.isSubmitting) return;
    emit(const .new(isSubmitting: true));

    final result = await _authRepository.signIn(
      email: email,
      password: password,
    );

    result.fold(
      onSuccess: (_) => emit(const .new()),
      onFailure: (exception) => emit(.new(failure: exception)),
    );
  }
}
