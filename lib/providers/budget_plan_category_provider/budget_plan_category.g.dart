// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_plan_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetPlanCategoryImpl _$$BudgetPlanCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$BudgetPlanCategoryImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      v: json['v'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BudgetPlanCategoryImplToJson(
        _$BudgetPlanCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'v': instance.v,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
