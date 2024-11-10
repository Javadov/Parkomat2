import 'package:objectbox/objectbox.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parking.g.dart';

@JsonSerializable()
@Entity()
class Parking {
  @Id(assignable: true)
  int id;
  int vehicleId;
  int parkingSpaceId;
  DateTime startTime;
  DateTime? endTime;

  Parking({this.id = 0, required this.vehicleId, required this.parkingSpaceId, required this.startTime, this.endTime});

  factory Parking.fromJson(Map<String, dynamic> json) => _$ParkingFromJson(json);
  Map<String, dynamic> toJson() => _$ParkingToJson(this);
}
