// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BudgetPlan _$BudgetPlanFromJson(Map<String, dynamic> json) {
  return _BudgetPlan.fromJson(json);
}

/// @nodoc
mixin _$BudgetPlan {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  bool get isPrimaryPlan => throw _privateConstructorUsedError;
  List<BudgetPlanCategory> get categories => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetPlanCopyWith<BudgetPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetPlanCopyWith<$Res> {
  factory $BudgetPlanCopyWith(
          BudgetPlan value, $Res Function(BudgetPlan) then) =
      _$BudgetPlanCopyWithImpl<$Res, BudgetPlan>;
  @useResult
  $Res call(
      {String id,
      String title,
      String user,
      bool isPrimaryPlan,
      List<BudgetPlanCategory> categories,
      DateTime createdAt,
      DateTime updatedAt,
      int v});
}

/// @nodoc
class _$BudgetPlanCopyWithImpl<$Res, $Val extends BudgetPlan>
    implements $BudgetPlanCopyWith<$Res> {
  _$BudgetPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? user = null,
    Object? isPrimaryPlan = null,
    Object? categories = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? v = null,
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
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      isPrimaryPlan: null == isPrimaryPlan
          ? _value.isPrimaryPlan
          : isPrimaryPlan // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<BudgetPlanCategory>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetPlanImplCopyWith<$Res>
    implements $BudgetPlanCopyWith<$Res> {
  factory _$$BudgetPlanImplCopyWith(
          _$BudgetPlanImpl value, $Res Function(_$BudgetPlanImpl) then) =
      __$$BudgetPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String user,
      bool isPrimaryPlan,
      List<BudgetPlanCategory> categories,
      DateTime createdAt,
      DateTime updatedAt,
      int v});
}

/// @nodoc
class __$$BudgetPlanImplCopyWithImpl<$Res>
    extends _$BudgetPlanCopyWithImpl<$Res, _$BudgetPlanImpl>
    implements _$$BudgetPlanImplCopyWith<$Res> {
  __$$BudgetPlanImplCopyWithImpl(
      _$BudgetPlanImpl _value, $Res Function(_$BudgetPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? user = null,
    Object? isPrimaryPlan = null,
    Object? categories = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? v = null,
  }) {
    return _then(_$BudgetPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      isPrimaryPlan: null == isPrimaryPlan
          ? _value.isPrimaryPlan
          : isPrimaryPlan // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<BudgetPlanCategory>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetPlanImpl implements _BudgetPlan {
  _$BudgetPlanImpl(
      {required this.id,
      required this.title,
      required this.user,
      required this.isPrimaryPlan,
      required final List<BudgetPlanCategory> categories,
      required this.createdAt,
      required this.updatedAt,
      required this.v})
      : _categories = categories;

  factory _$BudgetPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetPlanImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String user;
  @override
  final bool isPrimaryPlan;
  final List<BudgetPlanCategory> _categories;
  @override
  List<BudgetPlanCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int v;

  @override
  String toString() {
    return 'BudgetPlan(id: $id, title: $title, user: $user, isPrimaryPlan: $isPrimaryPlan, categories: $categories, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isPrimaryPlan, isPrimaryPlan) ||
                other.isPrimaryPlan == isPrimaryPlan) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      user,
      isPrimaryPlan,
      const DeepCollectionEquality().hash(_categories),
      createdAt,
      updatedAt,
      v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetPlanImplCopyWith<_$BudgetPlanImpl> get copyWith =>
      __$$BudgetPlanImplCopyWithImpl<_$BudgetPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetPlanImplToJson(
      this,
    );
  }
}

abstract class _BudgetPlan implements BudgetPlan {
  factory _BudgetPlan(
      {required final String id,
      required final String title,
      required final String user,
      required final bool isPrimaryPlan,
      required final List<BudgetPlanCategory> categories,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final int v}) = _$BudgetPlanImpl;

  factory _BudgetPlan.fromJson(Map<String, dynamic> json) =
      _$BudgetPlanImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get user;
  @override
  bool get isPrimaryPlan;
  @override
  List<BudgetPlanCategory> get categories;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get v;
  @override
  @JsonKey(ignore: true)
  _$$BudgetPlanImplCopyWith<_$BudgetPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
