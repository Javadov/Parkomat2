import 'package:json_annotation/json_annotation.dart';

part 'parking.g.dart';

@JsonSerializable()
class Parking {
  int id;
  int vehicleId;
  int parkingSpaceId;
  DateTime startTime;
  DateTime? endTime;

  Parking({required this.id, required this.vehicleId, required this.parkingSpaceId, required this.startTime, this.endTime});

  factory Parking.fromJson(Map<String, dynamic> json) => _$ParkingFromJson(json);
  Map<String, dynamic> toJson() => _$ParkingToJson(this);

  @override
  String toString() => 'ID: $id, Vehicle ID: $vehicleId, Parking Space ID: $parkingSpaceId, Start Time: $startTime, End Time: $endTime';
}