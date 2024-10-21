// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      address: json['address'] as String?,
      customer: json['customer'] as String?,
      dateTime: json['dateTime'] as String?,
      item: json['item'] as String?,
      phone: json['phone'] is int
          ? json['phone'] as int
          : int.tryParse(json['phone'].toString()) ?? 0,
      price: (json['price'] as num?)?.toDouble(),
      transactionId: json['transactionId'] as String?,
      // id: json['id'] as String?,
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'address': instance.address,
      'customer': instance.customer,
      'dateTime': instance.dateTime,
      'item': instance.item,
      'phone': instance.phone,
      'price': instance.price,
      'transactionId': instance.transactionId,
      // 'id': instance.id,
    };
