import 'package:objectbox/objectbox.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parking_space.g.dart';

@JsonSerializable()
@Entity()
class ParkingSpace {
  @Id(assignable: true)
  int id;
  String address;
  double pricePerHour;

  ParkingSpace({this.id = 0, required this.address, required this.pricePerHour});

  factory ParkingSpace.fromJson(Map<String, dynamic> json) => _$ParkingSpaceFromJson(json);
  Map<String, dynamic> toJson() => _$ParkingSpaceToJson(this);
}
