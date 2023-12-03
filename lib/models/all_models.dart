import 'package:flutter/material.dart';

class TransactionButtonData {
  final String text;
  final IconData icon;
  final String type;

  TransactionButtonData(this.text, this.icon, this.type);
}

class PlanCategory {
  final String title;
  final double percentage;
  final Color? color;

  PlanCategory(
      {required this.title, required this.percentage, required this.color});

  PlanCategory copyWith({
    String? title,
    double? percentage,
    Color? color,
  }) {
    return PlanCategory(
      title: title ?? this.title,
      percentage: percentage ?? this.percentage,
      color: color ?? this.color,
    );
  }
}

class DisbursementPlan {
  final String title;
  final List<PlanCategory> categories;

  DisbursementPlan({required this.title, required this.categories});

  clone() {
    return DisbursementPlan(title: title, categories: categories);
  }
}

class CashbuddyUser {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? country;
  final String? userRole;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? token;

  CashbuddyUser({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.password,
    this.phoneNumber,
    this.country,
    this.userRole,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (firstName != null) data['firstName'] = firstName;
    if (lastName != null) data['lastName'] = lastName;
    if (username != null) data['username'] = username;
    if (email != null) data['email'] = email;
    if (password != null) data['password'] = password;
    if (phoneNumber != null) data['phoneNumber'] = phoneNumber;
    if (country != null) data['country'] = country;
    if (userRole != null) data['userRole'] = userRole;

    return data;
  }
}
