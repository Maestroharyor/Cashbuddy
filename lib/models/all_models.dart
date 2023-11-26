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
