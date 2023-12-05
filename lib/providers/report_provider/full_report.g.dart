// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FullReportImpl _$$FullReportImplFromJson(Map<String, dynamic> json) =>
    _$FullReportImpl(
      totalSavings: (json['totalSavings'] as num).toDouble(),
      totalIncome: (json['totalIncome'] as num).toDouble(),
      totalExpense: (json['totalExpense'] as num).toDouble(),
      currentMonthData: CurrentMonthData.fromJson(
          json['currentMonthData'] as Map<String, dynamic>),
      graphData: GraphData.fromJson(json['graphData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FullReportImplToJson(_$FullReportImpl instance) =>
    <String, dynamic>{
      'totalSavings': instance.totalSavings,
      'totalIncome': instance.totalIncome,
      'totalExpense': instance.totalExpense,
      'currentMonthData': instance.currentMonthData,
      'graphData': instance.graphData,
    };

_$CurrentMonthDataImpl _$$CurrentMonthDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrentMonthDataImpl(
      expenses:
          IncomeExpenseData.fromJson(json['expenses'] as Map<String, dynamic>),
      income:
          IncomeExpenseData.fromJson(json['income'] as Map<String, dynamic>),
      outflowDetails: (json['outflowDetails'] as List<dynamic>)
          .map((e) => TransactionDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CurrentMonthDataImplToJson(
        _$CurrentMonthDataImpl instance) =>
    <String, dynamic>{
      'expenses': instance.expenses,
      'income': instance.income,
      'outflowDetails': instance.outflowDetails,
    };

_$IncomeExpenseDataImpl _$$IncomeExpenseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$IncomeExpenseDataImpl(
      total: (json['total'] as num).toDouble(),
      isIncrease: json['isIncrease'] as bool,
      percent: (json['percent'] as num).toDouble(),
    );

Map<String, dynamic> _$$IncomeExpenseDataImplToJson(
        _$IncomeExpenseDataImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'isIncrease': instance.isIncrease,
      'percent': instance.percent,
    };

_$GraphDataImpl _$$GraphDataImplFromJson(Map<String, dynamic> json) =>
    _$GraphDataImpl(
      weeklyData: (json['weeklyData'] as List<dynamic>)
          .map((e) => TimeFrameData.fromJson(e as Map<String, dynamic>))
          .toList(),
      monthlyData: (json['monthlyData'] as List<dynamic>)
          .map((e) => TimeFrameData.fromJson(e as Map<String, dynamic>))
          .toList(),
      yearlyData: (json['yearlyData'] as List<dynamic>)
          .map((e) => TimeFrameData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GraphDataImplToJson(_$GraphDataImpl instance) =>
    <String, dynamic>{
      'weeklyData': instance.weeklyData,
      'monthlyData': instance.monthlyData,
      'yearlyData': instance.yearlyData,
    };

_$TimeFrameDataImpl _$$TimeFrameDataImplFromJson(Map<String, dynamic> json) =>
    _$TimeFrameDataImpl(
      timeFrame: json['timeFrame'] as String,
      total: (json['total'] as num).toDouble(),
      data: (json['data'] as List<dynamic>)
          .map((e) => TransactionDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TimeFrameDataImplToJson(_$TimeFrameDataImpl instance) =>
    <String, dynamic>{
      'timeFrame': instance.timeFrame,
      'total': instance.total,
      'data': instance.data,
    };

_$TransactionDetailsImpl _$$TransactionDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionDetailsImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      transactionType: json['transactionType'] as String,
      amount: (json['amount'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TransactionDetailsImplToJson(
        _$TransactionDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'transactionType': instance.transactionType,
      'amount': instance.amount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
