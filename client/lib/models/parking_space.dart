import 'package:json_annotation/json_annotation.dart';

part 'parking_space.g.dart';

@JsonSerializable()
class ParkingSpace {
  int id;
  String address;
  double pricePerHour;

  ParkingSpace({required this.id, required this.address, required this.pricePerHour});

  factory ParkingSpace.fromJson(Map<String, dynamic> json) => _$ParkingSpaceFromJson(json);
  Map<String, dynamic> toJson() => _$ParkingSpaceToJson(this);

  @override
  String toString() => 'ID: $id, Address: $address, Price/Hour: $pricePerHour';
}