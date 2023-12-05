// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'full_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FullReport _$FullReportFromJson(Map<String, dynamic> json) {
  return _FullReport.fromJson(json);
}

/// @nodoc
mixin _$FullReport {
  double get totalSavings => throw _privateConstructorUsedError;
  double get totalIncome => throw _privateConstructorUsedError;
  double get totalExpense => throw _privateConstructorUsedError;
  CurrentMonthData get currentMonthData => throw _privateConstructorUsedError;
  GraphData get graphData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FullReportCopyWith<FullReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullReportCopyWith<$Res> {
  factory $FullReportCopyWith(
          FullReport value, $Res Function(FullReport) then) =
      _$FullReportCopyWithImpl<$Res, FullReport>;
  @useResult
  $Res call(
      {double totalSavings,
      double totalIncome,
      double totalExpense,
      CurrentMonthData currentMonthData,
      GraphData graphData});

  $CurrentMonthDataCopyWith<$Res> get currentMonthData;
  $GraphDataCopyWith<$Res> get graphData;
}

/// @nodoc
class _$FullReportCopyWithImpl<$Res, $Val extends FullReport>
    implements $FullReportCopyWith<$Res> {
  _$FullReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSavings = null,
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? currentMonthData = null,
    Object? graphData = null,
  }) {
    return _then(_value.copyWith(
      totalSavings: null == totalSavings
          ? _value.totalSavings
          : totalSavings // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      currentMonthData: null == currentMonthData
          ? _value.currentMonthData
          : currentMonthData // ignore: cast_nullable_to_non_nullable
              as CurrentMonthData,
      graphData: null == graphData
          ? _value.graphData
          : graphData // ignore: cast_nullable_to_non_nullable
              as GraphData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentMonthDataCopyWith<$Res> get currentMonthData {
    return $CurrentMonthDataCopyWith<$Res>(_value.currentMonthData, (value) {
      return _then(_value.copyWith(currentMonthData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GraphDataCopyWith<$Res> get graphData {
    return $GraphDataCopyWith<$Res>(_value.graphData, (value) {
      return _then(_value.copyWith(graphData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FullReportImplCopyWith<$Res>
    implements $FullReportCopyWith<$Res> {
  factory _$$FullReportImplCopyWith(
          _$FullReportImpl value, $Res Function(_$FullReportImpl) then) =
      __$$FullReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalSavings,
      double totalIncome,
      double totalExpense,
      CurrentMonthData currentMonthData,
      GraphData graphData});

  @override
  $CurrentMonthDataCopyWith<$Res> get currentMonthData;
  @override
  $GraphDataCopyWith<$Res> get graphData;
}

/// @nodoc
class __$$FullReportImplCopyWithImpl<$Res>
    extends _$FullReportCopyWithImpl<$Res, _$FullReportImpl>
    implements _$$FullReportImplCopyWith<$Res> {
  __$$FullReportImplCopyWithImpl(
      _$FullReportImpl _value, $Res Function(_$FullReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSavings = null,
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? currentMonthData = null,
    Object? graphData = null,
  }) {
    return _then(_$FullReportImpl(
      totalSavings: null == totalSavings
          ? _value.totalSavings
          : totalSavings // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      currentMonthData: null == currentMonthData
          ? _value.currentMonthData
          : currentMonthData // ignore: cast_nullable_to_non_nullable
              as CurrentMonthData,
      graphData: null == graphData
          ? _value.graphData
          : graphData // ignore: cast_nullable_to_non_nullable
              as GraphData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FullReportImpl implements _FullReport {
  _$FullReportImpl(
      {required this.totalSavings,
      required this.totalIncome,
      required this.totalExpense,
      required this.currentMonthData,
      required this.graphData});

  factory _$FullReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$FullReportImplFromJson(json);

  @override
  final double totalSavings;
  @override
  final double totalIncome;
  @override
  final double totalExpense;
  @override
  final CurrentMonthData currentMonthData;
  @override
  final GraphData graphData;

  @override
  String toString() {
    return 'FullReport(totalSavings: $totalSavings, totalIncome: $totalIncome, totalExpense: $totalExpense, currentMonthData: $currentMonthData, graphData: $graphData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FullReportImpl &&
            (identical(other.totalSavings, totalSavings) ||
                other.totalSavings == totalSavings) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.currentMonthData, currentMonthData) ||
                other.currentMonthData == currentMonthData) &&
            (identical(other.graphData, graphData) ||
                other.graphData == graphData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalSavings, totalIncome,
      totalExpense, currentMonthData, graphData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FullReportImplCopyWith<_$FullReportImpl> get copyWith =>
      __$$FullReportImplCopyWithImpl<_$FullReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FullReportImplToJson(
      this,
    );
  }
}

abstract class _FullReport implements FullReport {
  factory _FullReport(
      {required final double totalSavings,
      required final double totalIncome,
      required final double totalExpense,
      required final CurrentMonthData currentMonthData,
      required final GraphData graphData}) = _$FullReportImpl;

  factory _FullReport.fromJson(Map<String, dynamic> json) =
      _$FullReportImpl.fromJson;

  @override
  double get totalSavings;
  @override
  double get totalIncome;
  @override
  double get totalExpense;
  @override
  CurrentMonthData get currentMonthData;
  @override
  GraphData get graphData;
  @override
  @JsonKey(ignore: true)
  _$$FullReportImplCopyWith<_$FullReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CurrentMonthData _$CurrentMonthDataFromJson(Map<String, dynamic> json) {
  return _CurrentMonthData.fromJson(json);
}

/// @nodoc
mixin _$CurrentMonthData {
  IncomeExpenseData get expenses => throw _privateConstructorUsedError;
  IncomeExpenseData get income => throw _privateConstructorUsedError;
  List<TransactionDetails> get outflowDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentMonthDataCopyWith<CurrentMonthData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentMonthDataCopyWith<$Res> {
  factory $CurrentMonthDataCopyWith(
          CurrentMonthData value, $Res Function(CurrentMonthData) then) =
      _$CurrentMonthDataCopyWithImpl<$Res, CurrentMonthData>;
  @useResult
  $Res call(
      {IncomeExpenseData expenses,
      IncomeExpenseData income,
      List<TransactionDetails> outflowDetails});

  $IncomeExpenseDataCopyWith<$Res> get expenses;
  $IncomeExpenseDataCopyWith<$Res> get income;
}

/// @nodoc
class _$CurrentMonthDataCopyWithImpl<$Res, $Val extends CurrentMonthData>
    implements $CurrentMonthDataCopyWith<$Res> {
  _$CurrentMonthDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? income = null,
    Object? outflowDetails = null,
  }) {
    return _then(_value.copyWith(
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as IncomeExpenseData,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as IncomeExpenseData,
      outflowDetails: null == outflowDetails
          ? _value.outflowDetails
          : outflowDetails // ignore: cast_nullable_to_non_nullable
              as List<TransactionDetails>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IncomeExpenseDataCopyWith<$Res> get expenses {
    return $IncomeExpenseDataCopyWith<$Res>(_value.expenses, (value) {
      return _then(_value.copyWith(expenses: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IncomeExpenseDataCopyWith<$Res> get income {
    return $IncomeExpenseDataCopyWith<$Res>(_value.income, (value) {
      return _then(_value.copyWith(income: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrentMonthDataImplCopyWith<$Res>
    implements $CurrentMonthDataCopyWith<$Res> {
  factory _$$CurrentMonthDataImplCopyWith(_$CurrentMonthDataImpl value,
          $Res Function(_$CurrentMonthDataImpl) then) =
      __$$CurrentMonthDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {IncomeExpenseData expenses,
      IncomeExpenseData income,
      List<TransactionDetails> outflowDetails});

  @override
  $IncomeExpenseDataCopyWith<$Res> get expenses;
  @override
  $IncomeExpenseDataCopyWith<$Res> get income;
}

/// @nodoc
class __$$CurrentMonthDataImplCopyWithImpl<$Res>
    extends _$CurrentMonthDataCopyWithImpl<$Res, _$CurrentMonthDataImpl>
    implements _$$CurrentMonthDataImplCopyWith<$Res> {
  __$$CurrentMonthDataImplCopyWithImpl(_$CurrentMonthDataImpl _value,
      $Res Function(_$CurrentMonthDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? income = null,
    Object? outflowDetails = null,
  }) {
    return _then(_$CurrentMonthDataImpl(
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as IncomeExpenseData,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as IncomeExpenseData,
      outflowDetails: null == outflowDetails
          ? _value._outflowDetails
          : outflowDetails // ignore: cast_nullable_to_non_nullable
              as List<TransactionDetails>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentMonthDataImpl implements _CurrentMonthData {
  _$CurrentMonthDataImpl(
      {required this.expenses,
      required this.income,
      required final List<TransactionDetails> outflowDetails})
      : _outflowDetails = outflowDetails;

  factory _$CurrentMonthDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentMonthDataImplFromJson(json);

  @override
  final IncomeExpenseData expenses;
  @override
  final IncomeExpenseData income;
  final List<TransactionDetails> _outflowDetails;
  @override
  List<TransactionDetails> get outflowDetails {
    if (_outflowDetails is EqualUnmodifiableListView) return _outflowDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outflowDetails);
  }

  @override
  String toString() {
    return 'CurrentMonthData(expenses: $expenses, income: $income, outflowDetails: $outflowDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentMonthDataImpl &&
            (identical(other.expenses, expenses) ||
                other.expenses == expenses) &&
            (identical(other.income, income) || other.income == income) &&
            const DeepCollectionEquality()
                .equals(other._outflowDetails, _outflowDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, expenses, income,
      const DeepCollectionEquality().hash(_outflowDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentMonthDataImplCopyWith<_$CurrentMonthDataImpl> get copyWith =>
      __$$CurrentMonthDataImplCopyWithImpl<_$CurrentMonthDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentMonthDataImplToJson(
      this,
    );
  }
}

abstract class _CurrentMonthData implements CurrentMonthData {
  factory _CurrentMonthData(
          {required final IncomeExpenseData expenses,
          required final IncomeExpenseData income,
          required final List<TransactionDetails> outflowDetails}) =
      _$CurrentMonthDataImpl;

  factory _CurrentMonthData.fromJson(Map<String, dynamic> json) =
      _$CurrentMonthDataImpl.fromJson;

  @override
  IncomeExpenseData get expenses;
  @override
  IncomeExpenseData get income;
  @override
  List<TransactionDetails> get outflowDetails;
  @override
  @JsonKey(ignore: true)
  _$$CurrentMonthDataImplCopyWith<_$CurrentMonthDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IncomeExpenseData _$IncomeExpenseDataFromJson(Map<String, dynamic> json) {
  return _IncomeExpenseData.fromJson(json);
}

/// @nodoc
mixin _$IncomeExpenseData {
  double get total => throw _privateConstructorUsedError;
  bool get isIncrease => throw _privateConstructorUsedError;
  double get percent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncomeExpenseDataCopyWith<IncomeExpenseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeExpenseDataCopyWith<$Res> {
  factory $IncomeExpenseDataCopyWith(
          IncomeExpenseData value, $Res Function(IncomeExpenseData) then) =
      _$IncomeExpenseDataCopyWithImpl<$Res, IncomeExpenseData>;
  @useResult
  $Res call({double total, bool isIncrease, double percent});
}

/// @nodoc
class _$IncomeExpenseDataCopyWithImpl<$Res, $Val extends IncomeExpenseData>
    implements $IncomeExpenseDataCopyWith<$Res> {
  _$IncomeExpenseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? isIncrease = null,
    Object? percent = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      isIncrease: null == isIncrease
          ? _value.isIncrease
          : isIncrease // ignore: cast_nullable_to_non_nullable
              as bool,
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncomeExpenseDataImplCopyWith<$Res>
    implements $IncomeExpenseDataCopyWith<$Res> {
  factory _$$IncomeExpenseDataImplCopyWith(_$IncomeExpenseDataImpl value,
          $Res Function(_$IncomeExpenseDataImpl) then) =
      __$$IncomeExpenseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double total, bool isIncrease, double percent});
}

/// @nodoc
class __$$IncomeExpenseDataImplCopyWithImpl<$Res>
    extends _$IncomeExpenseDataCopyWithImpl<$Res, _$IncomeExpenseDataImpl>
    implements _$$IncomeExpenseDataImplCopyWith<$Res> {
  __$$IncomeExpenseDataImplCopyWithImpl(_$IncomeExpenseDataImpl _value,
      $Res Function(_$IncomeExpenseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? isIncrease = null,
    Object? percent = null,
  }) {
    return _then(_$IncomeExpenseDataImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      isIncrease: null == isIncrease
          ? _value.isIncrease
          : isIncrease // ignore: cast_nullable_to_non_nullable
              as bool,
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncomeExpenseDataImpl implements _IncomeExpenseData {
  _$IncomeExpenseDataImpl(
      {required this.total, required this.isIncrease, required this.percent});

  factory _$IncomeExpenseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncomeExpenseDataImplFromJson(json);

  @override
  final double total;
  @override
  final bool isIncrease;
  @override
  final double percent;

  @override
  String toString() {
    return 'IncomeExpenseData(total: $total, isIncrease: $isIncrease, percent: $percent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeExpenseDataImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isIncrease, isIncrease) ||
                other.isIncrease == isIncrease) &&
            (identical(other.percent, percent) || other.percent == percent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, isIncrease, percent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeExpenseDataImplCopyWith<_$IncomeExpenseDataImpl> get copyWith =>
      __$$IncomeExpenseDataImplCopyWithImpl<_$IncomeExpenseDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncomeExpenseDataImplToJson(
      this,
    );
  }
}

abstract class _IncomeExpenseData implements IncomeExpenseData {
  factory _IncomeExpenseData(
      {required final double total,
      required final bool isIncrease,
      required final double percent}) = _$IncomeExpenseDataImpl;

  factory _IncomeExpenseData.fromJson(Map<String, dynamic> json) =
      _$IncomeExpenseDataImpl.fromJson;

  @override
  double get total;
  @override
  bool get isIncrease;
  @override
  double get percent;
  @override
  @JsonKey(ignore: true)
  _$$IncomeExpenseDataImplCopyWith<_$IncomeExpenseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GraphData _$GraphDataFromJson(Map<String, dynamic> json) {
  return _GraphData.fromJson(json);
}

/// @nodoc
mixin _$GraphData {
  List<TimeFrameData> get weeklyData => throw _privateConstructorUsedError;
  List<TimeFrameData> get monthlyData => throw _privateConstructorUsedError;
  List<TimeFrameData> get yearlyData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GraphDataCopyWith<GraphData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphDataCopyWith<$Res> {
  factory $GraphDataCopyWith(GraphData value, $Res Function(GraphData) then) =
      _$GraphDataCopyWithImpl<$Res, GraphData>;
  @useResult
  $Res call(
      {List<TimeFrameData> weeklyData,
      List<TimeFrameData> monthlyData,
      List<TimeFrameData> yearlyData});
}

/// @nodoc
class _$GraphDataCopyWithImpl<$Res, $Val extends GraphData>
    implements $GraphDataCopyWith<$Res> {
  _$GraphDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weeklyData = null,
    Object? monthlyData = null,
    Object? yearlyData = null,
  }) {
    return _then(_value.copyWith(
      weeklyData: null == weeklyData
          ? _value.weeklyData
          : weeklyData // ignore: cast_nullable_to_non_nullable
              as List<TimeFrameData>,
      monthlyData: null == monthlyData
          ? _value.monthlyData
          : monthlyData // ignore: cast_nullable_to_non_nullable
              as List<TimeFrameData>,
      yearlyData: null == yearlyData
          ? _value.yearlyData
          : yearlyData // ignore: cast_nullable_to_non_nullable
              as List<TimeFrameData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GraphDataImplCopyWith<$Res>
    implements $GraphDataCopyWith<$Res> {
  factory _$$GraphDataImplCopyWith(
          _$GraphDataImpl value, $Res Function(_$GraphDataImpl) then) =
      __$$GraphDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TimeFrameData> weeklyData,
      List<TimeFrameData> monthlyData,
      List<TimeFrameData> yearlyData});
}

/// @nodoc
class __$$GraphDataImplCopyWithImpl<$Res>
    extends _$GraphDataCopyWithImpl<$Res, _$GraphDataImpl>
    implements _$$GraphDataImplCopyWith<$Res> {
  __$$GraphDataImplCopyWithImpl(
      _$GraphDataImpl _value, $Res Function(_$GraphDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weeklyData = null,
    Object? monthlyData = null,
    Object? yearlyData = null,
  }) {
    return _then(_$GraphDataImpl(
      weeklyData: null == weeklyData
          ? _value._weeklyData
          : weeklyData // ignore: cast_nullable_to_non_nullable
              as List<TimeFrameData>,
      monthlyData: null == monthlyData
          ? _value._monthlyData
          : monthlyData // ignore: cast_nullable_to_non_nullable
              as List<TimeFrameData>,
      yearlyData: null == yearlyData
          ? _value._yearlyData
          : yearlyData // ignore: cast_nullable_to_non_nullable
              as List<TimeFrameData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GraphDataImpl implements _GraphData {
  _$GraphDataImpl(
      {required final List<TimeFrameData> weeklyData,
      required final List<TimeFrameData> monthlyData,
      required final List<TimeFrameData> yearlyData})
      : _weeklyData = weeklyData,
        _monthlyData = monthlyData,
        _yearlyData = yearlyData;

  factory _$GraphDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GraphDataImplFromJson(json);

  final List<TimeFrameData> _weeklyData;
  @override
  List<TimeFrameData> get weeklyData {
    if (_weeklyData is EqualUnmodifiableListView) return _weeklyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyData);
  }

  final List<TimeFrameData> _monthlyData;
  @override
  List<TimeFrameData> get monthlyData {
    if (_monthlyData is EqualUnmodifiableListView) return _monthlyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlyData);
  }

  final List<TimeFrameData> _yearlyData;
  @override
  List<TimeFrameData> get yearlyData {
    if (_yearlyData is EqualUnmodifiableListView) return _yearlyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_yearlyData);
  }

  @override
  String toString() {
    return 'GraphData(weeklyData: $weeklyData, monthlyData: $monthlyData, yearlyData: $yearlyData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphDataImpl &&
            const DeepCollectionEquality()
                .equals(other._weeklyData, _weeklyData) &&
            const DeepCollectionEquality()
                .equals(other._monthlyData, _monthlyData) &&
            const DeepCollectionEquality()
                .equals(other._yearlyData, _yearlyData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_weeklyData),
      const DeepCollectionEquality().hash(_monthlyData),
      const DeepCollectionEquality().hash(_yearlyData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphDataImplCopyWith<_$GraphDataImpl> get copyWith =>
      __$$GraphDataImplCopyWithImpl<_$GraphDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GraphDataImplToJson(
      this,
    );
  }
}

abstract class _GraphData implements GraphData {
  factory _GraphData(
      {required final List<TimeFrameData> weeklyData,
      required final List<TimeFrameData> monthlyData,
      required final List<TimeFrameData> yearlyData}) = _$GraphDataImpl;

  factory _GraphData.fromJson(Map<String, dynamic> json) =
      _$GraphDataImpl.fromJson;

  @override
  List<TimeFrameData> get weeklyData;
  @override
  List<TimeFrameData> get monthlyData;
  @override
  List<TimeFrameData> get yearlyData;
  @override
  @JsonKey(ignore: true)
  _$$GraphDataImplCopyWith<_$GraphDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeFrameData _$TimeFrameDataFromJson(Map<String, dynamic> json) {
  return _TimeFrameData.fromJson(json);
}

/// @nodoc
mixin _$TimeFrameData {
  String get timeFrame => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  List<TransactionDetails> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeFrameDataCopyWith<TimeFrameData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeFrameDataCopyWith<$Res> {
  factory $TimeFrameDataCopyWith(
          TimeFrameData value, $Res Function(TimeFrameData) then) =
      _$TimeFrameDataCopyWithImpl<$Res, TimeFrameData>;
  @useResult
  $Res call({String timeFrame, double total, List<TransactionDetails> data});
}

/// @nodoc
class _$TimeFrameDataCopyWithImpl<$Res, $Val extends TimeFrameData>
    implements $TimeFrameDataCopyWith<$Res> {
  _$TimeFrameDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeFrame = null,
    Object? total = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      timeFrame: null == timeFrame
          ? _value.timeFrame
          : timeFrame // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionDetails>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeFrameDataImplCopyWith<$Res>
    implements $TimeFrameDataCopyWith<$Res> {
  factory _$$TimeFrameDataImplCopyWith(
          _$TimeFrameDataImpl value, $Res Function(_$TimeFrameDataImpl) then) =
      __$$TimeFrameDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String timeFrame, double total, List<TransactionDetails> data});
}

/// @nodoc
class __$$TimeFrameDataImplCopyWithImpl<$Res>
    extends _$TimeFrameDataCopyWithImpl<$Res, _$TimeFrameDataImpl>
    implements _$$TimeFrameDataImplCopyWith<$Res> {
  __$$TimeFrameDataImplCopyWithImpl(
      _$TimeFrameDataImpl _value, $Res Function(_$TimeFrameDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeFrame = null,
    Object? total = null,
    Object? data = null,
  }) {
    return _then(_$TimeFrameDataImpl(
      timeFrame: null == timeFrame
          ? _value.timeFrame
          : timeFrame // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionDetails>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeFrameDataImpl implements _TimeFrameData {
  _$TimeFrameDataImpl(
      {required this.timeFrame,
      required this.total,
      required final List<TransactionDetails> data})
      : _data = data;

  factory _$TimeFrameDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeFrameDataImplFromJson(json);

  @override
  final String timeFrame;
  @override
  final double total;
  final List<TransactionDetails> _data;
  @override
  List<TransactionDetails> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TimeFrameData(timeFrame: $timeFrame, total: $total, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeFrameDataImpl &&
            (identical(other.timeFrame, timeFrame) ||
                other.timeFrame == timeFrame) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timeFrame, total,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeFrameDataImplCopyWith<_$TimeFrameDataImpl> get copyWith =>
      __$$TimeFrameDataImplCopyWithImpl<_$TimeFrameDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeFrameDataImplToJson(
      this,
    );
  }
}

abstract class _TimeFrameData implements TimeFrameData {
  factory _TimeFrameData(
      {required final String timeFrame,
      required final double total,
      required final List<TransactionDetails> data}) = _$TimeFrameDataImpl;

  factory _TimeFrameData.fromJson(Map<String, dynamic> json) =
      _$TimeFrameDataImpl.fromJson;

  @override
  String get timeFrame;
  @override
  double get total;
  @override
  List<TransactionDetails> get data;
  @override
  @JsonKey(ignore: true)
  _$$TimeFrameDataImplCopyWith<_$TimeFrameDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionDetails _$TransactionDetailsFromJson(Map<String, dynamic> json) {
  return _TransactionDetails.fromJson(json);
}

/// @nodoc
mixin _$TransactionDetails {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get transactionType => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionDetailsCopyWith<TransactionDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDetailsCopyWith<$Res> {
  factory $TransactionDetailsCopyWith(
          TransactionDetails value, $Res Function(TransactionDetails) then) =
      _$TransactionDetailsCopyWithImpl<$Res, TransactionDetails>;
  @useResult
  $Res call(
      {String id,
      String title,
      String transactionType,
      double amount,
      DateTime createdAt});
}

/// @nodoc
class _$TransactionDetailsCopyWithImpl<$Res, $Val extends TransactionDetails>
    implements $TransactionDetailsCopyWith<$Res> {
  _$TransactionDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? transactionType = null,
    Object? amount = null,
    Object? createdAt = null,
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
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionDetailsImplCopyWith<$Res>
    implements $TransactionDetailsCopyWith<$Res> {
  factory _$$TransactionDetailsImplCopyWith(_$TransactionDetailsImpl value,
          $Res Function(_$TransactionDetailsImpl) then) =
      __$$TransactionDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String transactionType,
      double amount,
      DateTime createdAt});
}

/// @nodoc
class __$$TransactionDetailsImplCopyWithImpl<$Res>
    extends _$TransactionDetailsCopyWithImpl<$Res, _$TransactionDetailsImpl>
    implements _$$TransactionDetailsImplCopyWith<$Res> {
  __$$TransactionDetailsImplCopyWithImpl(_$TransactionDetailsImpl _value,
      $Res Function(_$TransactionDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? transactionType = null,
    Object? amount = null,
    Object? createdAt = null,
  }) {
    return _then(_$TransactionDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionDetailsImpl implements _TransactionDetails {
  _$TransactionDetailsImpl(
      {required this.id,
      required this.title,
      required this.transactionType,
      required this.amount,
      required this.createdAt});

  factory _$TransactionDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionDetailsImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String transactionType;
  @override
  final double amount;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'TransactionDetails(id: $id, title: $title, transactionType: $transactionType, amount: $amount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, transactionType, amount, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionDetailsImplCopyWith<_$TransactionDetailsImpl> get copyWith =>
      __$$TransactionDetailsImplCopyWithImpl<_$TransactionDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionDetailsImplToJson(
      this,
    );
  }
}

abstract class _TransactionDetails implements TransactionDetails {
  factory _TransactionDetails(
      {required final String id,
      required final String title,
      required final String transactionType,
      required final double amount,
      required final DateTime createdAt}) = _$TransactionDetailsImpl;

  factory _TransactionDetails.fromJson(Map<String, dynamic> json) =
      _$TransactionDetailsImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get transactionType;
  @override
  double get amount;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$TransactionDetailsImplCopyWith<_$TransactionDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
