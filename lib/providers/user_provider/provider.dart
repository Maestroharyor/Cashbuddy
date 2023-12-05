import 'dart:convert';
import 'package:cashbuddy/models/all_models.dart';
import 'package:cashbuddy/providers/auth_provider/auth.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth_provider/provider.dart';
import 'user.dart';
import '../../server/api_client.dart';
// Necessary for code-generation to work
part 'provider.g.dart';

DioInstance cashbuddyFetch = DioInstance();

@riverpod
class AuthUser extends _$AuthUser {
  @override
  Future<User> build() async {
    final AsyncValue<AuthModel> token = ref.watch(authProvider);
    final AsyncValue<User> userToWatch = ref.watch(authUserProvider);
    try {
      // if (token.value!.token.isEmpty) {
      //   throw "Something went wrong";
      // }

      if (token.value!.token.isEmpty) {
        return User(
          userId: "",
          firstName: "",
          lastName: "",
          username: "",
          email: "",
          phoneNumber: "",
          country: "",
          userRole: "",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      }

      if (userToWatch.value != null) {
        return userToWatch.value!;
      }

      cashbuddyFetch.setToken(token.value?.token ?? "");
      final response = await cashbuddyFetch.dio.get('/users/profile');

      if (response.statusCode != 200) {
        print("Something went wrong");
      }

      final userResponse = response.data['data'];
      final user = User.fromJson(userResponse);

      return user;
    } catch (e) {
      // throw "Something went wrong";
      return User(
        userId: "",
        firstName: "",
        lastName: "",
        username: "",
        email: "",
        phoneNumber: "",
        country: "",
        userRole: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    }
  }

  Future<void> setUser(CashbuddyUser data) async {
    try {
      User user = User(
          userId: data.id ?? "",
          firstName: data.firstName ?? "",
          lastName: data.lastName ?? "",
          username: data.username ?? "",
          email: data.email ?? "",
          phoneNumber: data.phoneNumber ?? "",
          country: data.country ?? "",
          userRole: data.userRole ?? "",
          createdAt: data.createdAt ?? DateTime.now(),
          updatedAt: data.updatedAt ?? DateTime.now());

      AuthModel auth = AuthModel(
          token: data.token ?? "", refreshToken: '', isLoggedIn: true);

      ref.read(authProvider.notifier).loginAuthUser(auth);
      state = AsyncData(user);
      print("USer data updated");
      // ref.invalidateSelf();
      // await future;
    } catch (e) {
      print("Something went wrong");
    }
  }

  Future<void> updateUser(CashbuddyUser data) async {
    final AsyncValue<AuthModel> token = ref.watch(authProvider);
    try {
      print(data);
      cashbuddyFetch.setToken(token.value?.token ?? "");
      final response = await cashbuddyFetch.dio
          .put('/users/${state.value!.userId}', data: data.toJson());

      if (response.statusCode != 200) {
        print("Something went wrong");
      }

      final userResponse = response.data['data'];
      final user = User.fromJson(userResponse);

      state = AsyncData(user);
      // ref.invalidateSelf();
      // await future;
    } catch (e) {
      print(e);
      // print("Something went wrong");
    }
  }

  Future<dynamic> loginUser(CashbuddyUser data) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final response =
          await cashbuddyFetch.dio.post('/auth/login', data: data.toJson());

      print({response});
      if (response.statusCode != 200) {
        print("Something went wrong provider");
      }

      final userResponse = response.data['data'];
      final user = User.fromJson(userResponse);

      AuthModel auth = AuthModel(
          token: userResponse['token'], refreshToken: '', isLoggedIn: true);

      final dataToSave = userResponse;
      dataToSave['id'] = userResponse['_id'];
      prefs.setString('user', jsonEncode(dataToSave));
      ref.read(authProvider.notifier).loginAuthUser(auth);
      state = AsyncData(user);
      return response.data;
    } catch (e) {
      final error = e as DioException;
      return error.response!.data;
    }
  }

  Future<dynamic> signupUser(CashbuddyUser data) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final response =
          await cashbuddyFetch.dio.post('/auth/signup', data: data.toJson());

      print({response});
      if (response.statusCode != 200) {
        print("Something went wrong");
      }

      final userResponse = response.data['data'];
      final user = User.fromJson(userResponse);

      AuthModel auth = AuthModel(
          token: userResponse['token'], refreshToken: '', isLoggedIn: true);

      final dataToSave = userResponse;
      dataToSave['id'] = userResponse['_id'];
      prefs.setString('user', jsonEncode(dataToSave));
      ref.read(authProvider.notifier).loginAuthUser(auth);
      state = AsyncData(user);

      return response.data;
    } catch (e) {
      final error = e as DioException;
      return error.response!.data;
    }
  }

  Future<dynamic> resetPassword(CashbuddyUser data) async {
    try {
      final response = await cashbuddyFetch.dio
          .post('/auth/reset-password', data: data.toJson());

      if (response.statusCode != 200) {
        print("Something went wrong");
      }

      return response.data;
    } catch (e) {
      final error = e as DioException;
      return error.response!.data;
    }
  }

  Future<dynamic> verifyResetPassword(CashbuddyUser data) async {
    try {
      print(data.toJson());
      final response = await cashbuddyFetch.dio
          .post('/auth/verify-reset-password', data: data.toJson());

      if (response.statusCode != 200) {
        print("Something went wrong");
      }

      return response.data;
    } catch (e) {
      final error = e as DioException;
      return error.response!.data;
    }
  }
}
