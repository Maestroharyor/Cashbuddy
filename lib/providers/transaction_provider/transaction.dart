import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  factory Transaction({
    required String id,
    required String title,
    required String details,
    required TransactionCategory category,
    required String transactionType,
    required double amount,
    required CreatedBy createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

@freezed
class TransactionCategory with _$TransactionCategory {
  factory TransactionCategory({
    required String id,
    required String title,
    required String transactionType,
  }) = _TransactionCategory;

  factory TransactionCategory.fromJson(Map<String, dynamic> json) =>
      _$TransactionCategoryFromJson(json);
}

@freezed
class CreatedBy with _$CreatedBy {
  factory CreatedBy({
    required String id,
    required String firstName,
    required String lastName,
    required String username,
    required String email,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
}
