import 'package:cashbuddy/providers/auth_provider/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Necessary for code-generation to work
part 'provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  Future<AuthModel> build() async =>
      AuthModel(token: "", refreshToken: "", isLoggedIn: false);

  Future<void> loginAuthUser(AuthModel auth) async {
    AuthModel updatedToken = AuthModel(
        token: auth.token, refreshToken: auth.refreshToken, isLoggedIn: true);
    // We update the local cache to match the new state.
    // This will notify all listeners.
    state = AsyncData(updatedToken);
  }

  Future<void> logoutAuthUser() async {
    AuthModel updatedToken =
        AuthModel(token: "", refreshToken: "", isLoggedIn: false);
    // We update the local cache to match the new state.
    // This will notify all listeners.
    state = AsyncData(updatedToken);
  }
}
