// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionTimelineImpl _$$TransactionTimelineImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionTimelineImpl(
      monthName: json['monthName'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TransactionTimelineImplToJson(
        _$TransactionTimelineImpl instance) =>
    <String, dynamic>{
      'monthName': instance.monthName,
      'data': instance.data,
    };
