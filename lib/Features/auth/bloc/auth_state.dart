// lib/features/auth/bloc/auth_state.dart
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String token;
  final Map<String, dynamic> user;  // or create a User model
  AuthAuthenticated(this.token, this.user);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}