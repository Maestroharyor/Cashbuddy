// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetPlanImpl _$$BudgetPlanImplFromJson(Map<String, dynamic> json) =>
    _$BudgetPlanImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      user: json['user'] as String,
      isPrimaryPlan: json['isPrimaryPlan'] as bool,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => BudgetPlanCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: json['v'] as int,
    );

Map<String, dynamic> _$$BudgetPlanImplToJson(_$BudgetPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'user': instance.user,
      'isPrimaryPlan': instance.isPrimaryPlan,
      'categories': instance.categories,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'v': instance.v,
    };
