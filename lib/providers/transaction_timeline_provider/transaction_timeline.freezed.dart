// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_timeline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionTimeline _$TransactionTimelineFromJson(Map<String, dynamic> json) {
  return _TransactionTimeline.fromJson(json);
}

/// @nodoc
mixin _$TransactionTimeline {
  String get monthName => throw _privateConstructorUsedError;
  List<Transaction> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionTimelineCopyWith<TransactionTimeline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionTimelineCopyWith<$Res> {
  factory $TransactionTimelineCopyWith(
          TransactionTimeline value, $Res Function(TransactionTimeline) then) =
      _$TransactionTimelineCopyWithImpl<$Res, TransactionTimeline>;
  @useResult
  $Res call({String monthName, List<Transaction> data});
}

/// @nodoc
class _$TransactionTimelineCopyWithImpl<$Res, $Val extends TransactionTimeline>
    implements $TransactionTimelineCopyWith<$Res> {
  _$TransactionTimelineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthName = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      monthName: null == monthName
          ? _value.monthName
          : monthName // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionTimelineImplCopyWith<$Res>
    implements $TransactionTimelineCopyWith<$Res> {
  factory _$$TransactionTimelineImplCopyWith(_$TransactionTimelineImpl value,
          $Res Function(_$TransactionTimelineImpl) then) =
      __$$TransactionTimelineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String monthName, List<Transaction> data});
}

/// @nodoc
class __$$TransactionTimelineImplCopyWithImpl<$Res>
    extends _$TransactionTimelineCopyWithImpl<$Res, _$TransactionTimelineImpl>
    implements _$$TransactionTimelineImplCopyWith<$Res> {
  __$$TransactionTimelineImplCopyWithImpl(_$TransactionTimelineImpl _value,
      $Res Function(_$TransactionTimelineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthName = null,
    Object? data = null,
  }) {
    return _then(_$TransactionTimelineImpl(
      monthName: null == monthName
          ? _value.monthName
          : monthName // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionTimelineImpl implements _TransactionTimeline {
  _$TransactionTimelineImpl(
      {required this.monthName, required final List<Transaction> data})
      : _data = data;

  factory _$TransactionTimelineImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionTimelineImplFromJson(json);

  @override
  final String monthName;
  final List<Transaction> _data;
  @override
  List<Transaction> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TransactionTimeline(monthName: $monthName, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionTimelineImpl &&
            (identical(other.monthName, monthName) ||
                other.monthName == monthName) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, monthName, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionTimelineImplCopyWith<_$TransactionTimelineImpl> get copyWith =>
      __$$TransactionTimelineImplCopyWithImpl<_$TransactionTimelineImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionTimelineImplToJson(
      this,
    );
  }
}

abstract class _TransactionTimeline implements TransactionTimeline {
  factory _TransactionTimeline(
      {required final String monthName,
      required final List<Transaction> data}) = _$TransactionTimelineImpl;

  factory _TransactionTimeline.fromJson(Map<String, dynamic> json) =
      _$TransactionTimelineImpl.fromJson;

  @override
  String get monthName;
  @override
  List<Transaction> get data;
  @override
  @JsonKey(ignore: true)
  _$$TransactionTimelineImplCopyWith<_$TransactionTimelineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
