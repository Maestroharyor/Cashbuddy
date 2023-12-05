import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_summary.freezed.dart';
part 'report_summary.g.dart';

@freezed
class ReportSummary with _$ReportSummary {
  factory ReportSummary({
    required double totalSavings,
    required double totalIncome,
    required double totalExpense,
  }) = _ReportSummary;

  factory ReportSummary.fromJson(Map<String, dynamic> json) =>
      _$ReportSummaryFromJson(json);
}
