import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  factory Notification({
    required String id,
    required String title,
    required String category,
    required String body,
    required bool isRead,
    required String user,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int v,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
