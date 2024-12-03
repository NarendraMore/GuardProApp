import 'package:hooks_riverpod/hooks_riverpod.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);

class AuthState {
  final bool isAuthenticated;
  final String? userName;

  AuthState({this.isAuthenticated = false, this.userName});
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  void login(String username) {
    state = AuthState(isAuthenticated: true, userName: username);
  }

  void logout() {
    state = AuthState();
  }
}
