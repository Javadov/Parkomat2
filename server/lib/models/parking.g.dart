// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parking _$ParkingFromJson(Map<String, dynamic> json) => Parking(
      id: (json['id'] as num?)?.toInt() ?? 0,
      vehicleId: (json['vehicleId'] as num).toInt(),
      parkingSpaceId: (json['parkingSpaceId'] as num).toInt(),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$ParkingToJson(Parking instance) => <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'parkingSpaceId': instance.parkingSpaceId,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
    };
