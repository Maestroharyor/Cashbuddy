import 'package:freezed_annotation/freezed_annotation.dart';
import '../transaction_provider/transaction.dart';
part 'transaction_timeline.freezed.dart';
part 'transaction_timeline.g.dart';

@freezed
class TransactionTimeline with _$TransactionTimeline {
  factory TransactionTimeline({
    required String monthName,
    required List<Transaction> data,
  }) = _TransactionTimeline;

  factory TransactionTimeline.fromJson(Map<String, dynamic> json) =>
      _$TransactionTimelineFromJson(json);
}
