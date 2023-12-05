import 'package:freezed_annotation/freezed_annotation.dart';
import '../budget_plan_category_provider/budget_plan_category.dart';
part 'budget_plan.freezed.dart';
part 'budget_plan.g.dart';

@freezed
class BudgetPlan with _$BudgetPlan {
  factory BudgetPlan({
    required String id,
    required String title,
    required String user,
    required bool isPrimaryPlan,
    required List<BudgetPlanCategory> categories,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int v,
  }) = _BudgetPlan;

  factory BudgetPlan.fromJson(Map<String, dynamic> json) =>
      _$BudgetPlanFromJson(json);
}
