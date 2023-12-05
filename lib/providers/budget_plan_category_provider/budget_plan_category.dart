import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_plan_category.freezed.dart';
part 'budget_plan_category.g.dart';

@freezed
class BudgetPlanCategory with _$BudgetPlanCategory {
  factory BudgetPlanCategory({
    required String id,
    required String title,
    required String type,
    required int v,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BudgetPlanCategory;

  factory BudgetPlanCategory.fromJson(Map<String, dynamic> json) =>
      _$BudgetPlanCategoryFromJson(json);
}
