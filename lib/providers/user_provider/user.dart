import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  // final bool? isLoggedIn = false;
  factory User(
      {@JsonKey(name: '_id')
      required String userId, // Use userId instead of _id
      required String firstName,
      required String lastName,
      required String username,
      required String email,
      required String phoneNumber,
      // required String password,
      required String country,
      required String userRole,
      required DateTime createdAt,
      required DateTime updatedAt}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
