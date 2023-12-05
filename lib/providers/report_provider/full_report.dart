import 'package:freezed_annotation/freezed_annotation.dart';

part 'full_report.freezed.dart';
part 'full_report.g.dart';

@freezed
class FullReport with _$FullReport {
  factory FullReport({
    required double totalSavings,
    required double totalIncome,
    required double totalExpense,
    required CurrentMonthData currentMonthData,
    required GraphData graphData,
  }) = _FullReport;

  factory FullReport.fromJson(Map<String, dynamic> json) =>
      _$FullReportFromJson(json);
}

@freezed
class CurrentMonthData with _$CurrentMonthData {
  factory CurrentMonthData({
    required IncomeExpenseData expenses,
    required IncomeExpenseData income,
    required List<TransactionDetails> outflowDetails,
  }) = _CurrentMonthData;

  factory CurrentMonthData.fromJson(Map<String, dynamic> json) =>
      _$CurrentMonthDataFromJson(json);
}

@freezed
class IncomeExpenseData with _$IncomeExpenseData {
  factory IncomeExpenseData({
    required double total,
    required bool isIncrease,
    required double percent,
  }) = _IncomeExpenseData;

  factory IncomeExpenseData.fromJson(Map<String, dynamic> json) =>
      _$IncomeExpenseDataFromJson(json);
}

@freezed
class GraphData with _$GraphData {
  factory GraphData({
    required List<TimeFrameData> weeklyData,
    required List<TimeFrameData> monthlyData,
    required List<TimeFrameData> yearlyData,
  }) = _GraphData;

  factory GraphData.fromJson(Map<String, dynamic> json) =>
      _$GraphDataFromJson(json);
}

@freezed
class TimeFrameData with _$TimeFrameData {
  factory TimeFrameData({
    required String timeFrame,
    required double total,
    required List<TransactionDetails> data,
  }) = _TimeFrameData;

  factory TimeFrameData.fromJson(Map<String, dynamic> json) =>
      _$TimeFrameDataFromJson(json);
}

@freezed
class TransactionDetails with _$TransactionDetails {
  factory TransactionDetails({
    required String id,
    required String title,
    required String transactionType,
    required double amount,
    required DateTime createdAt,
  }) = _TransactionDetails;

  factory TransactionDetails.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailsFromJson(json);
}
