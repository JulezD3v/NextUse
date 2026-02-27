// lib/features/auth/bloc/auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../data/auth_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  final _storage = const FlutterSecureStorage();

  AuthBloc(this._repository) : super(AuthInitial()) {
    on<LoginSubmitted>(_onLogin);
    on<RegisterSubmitted>(_onRegister);
  }

  Future<void> _onLogin(LoginSubmitted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await _repository.login(
        email: event.email,
        password: event.password,
      );
      final token = response['token'] as String;
      final user = response['user'] as Map<String, dynamic>;

      await _storage.write(key: 'jwt_token', value: token);
      // Optional: store user.id or role if needed later
      await _storage.write(key: 'user_role', value: user['role'] ?? 'household');

      emit(AuthAuthenticated(token, user));
    } catch (e) {
      emit(AuthFailure(e.toString().replaceFirst('Exception: ', '')));
    }
  }

  Future<void> _onRegister(RegisterSubmitted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await _repository.register(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      final token = response['token'] as String;
      final user = response['user'] as Map<String, dynamic>;

      await _storage.write(key: 'jwt_token', value: token);
      await _storage.write(key: 'user_role', value: user['role'] ?? 'household');

      emit(AuthAuthenticated(token, user));
    } catch (e) {
      emit(AuthFailure(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}