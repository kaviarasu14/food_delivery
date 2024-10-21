import 'package:json_annotation/json_annotation.dart';
part 'order.g.dart';

@JsonSerializable()
class Orders {
  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "customer")
  String? customer;

  @JsonKey(name: "dateTime")
  String? dateTime;

  @JsonKey(name: "item")
  String? item;

  @JsonKey(name: "phone")
  int? phone;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "transactionId")
  String? transactionId;

  // @JsonKey(name: "id")
  // String? id;

  Orders({
    this.address,
    this.customer,
    this.dateTime,
    this.item,
    this.phone,
    this.price,
    this.transactionId,
    // this.id
  });

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}
