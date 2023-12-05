// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_plan_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BudgetPlanCategory _$BudgetPlanCategoryFromJson(Map<String, dynamic> json) {
  return _BudgetPlanCategory.fromJson(json);
}

/// @nodoc
mixin _$BudgetPlanCategory {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get v => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetPlanCategoryCopyWith<BudgetPlanCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetPlanCategoryCopyWith<$Res> {
  factory $BudgetPlanCategoryCopyWith(
          BudgetPlanCategory value, $Res Function(BudgetPlanCategory) then) =
      _$BudgetPlanCategoryCopyWithImpl<$Res, BudgetPlanCategory>;
  @useResult
  $Res call(
      {String id,
      String title,
      String type,
      int v,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$BudgetPlanCategoryCopyWithImpl<$Res, $Val extends BudgetPlanCategory>
    implements $BudgetPlanCategoryCopyWith<$Res> {
  _$BudgetPlanCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? v = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetPlanCategoryImplCopyWith<$Res>
    implements $BudgetPlanCategoryCopyWith<$Res> {
  factory _$$BudgetPlanCategoryImplCopyWith(_$BudgetPlanCategoryImpl value,
          $Res Function(_$BudgetPlanCategoryImpl) then) =
      __$$BudgetPlanCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String type,
      int v,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$BudgetPlanCategoryImplCopyWithImpl<$Res>
    extends _$BudgetPlanCategoryCopyWithImpl<$Res, _$BudgetPlanCategoryImpl>
    implements _$$BudgetPlanCategoryImplCopyWith<$Res> {
  __$$BudgetPlanCategoryImplCopyWithImpl(_$BudgetPlanCategoryImpl _value,
      $Res Function(_$BudgetPlanCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? v = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BudgetPlanCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetPlanCategoryImpl implements _BudgetPlanCategory {
  _$BudgetPlanCategoryImpl(
      {required this.id,
      required this.title,
      required this.type,
      required this.v,
      required this.createdAt,
      required this.updatedAt});

  factory _$BudgetPlanCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetPlanCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String type;
  @override
  final int v;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BudgetPlanCategory(id: $id, title: $title, type: $type, v: $v, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetPlanCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, type, v, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetPlanCategoryImplCopyWith<_$BudgetPlanCategoryImpl> get copyWith =>
      __$$BudgetPlanCategoryImplCopyWithImpl<_$BudgetPlanCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetPlanCategoryImplToJson(
      this,
    );
  }
}

abstract class _BudgetPlanCategory implements BudgetPlanCategory {
  factory _BudgetPlanCategory(
      {required final String id,
      required final String title,
      required final String type,
      required final int v,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$BudgetPlanCategoryImpl;

  factory _BudgetPlanCategory.fromJson(Map<String, dynamic> json) =
      _$BudgetPlanCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get type;
  @override
  int get v;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BudgetPlanCategoryImplCopyWith<_$BudgetPlanCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
