// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_space.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParkingSpace _$ParkingSpaceFromJson(Map<String, dynamic> json) => ParkingSpace(
      id: (json['id'] as num?)?.toInt() ?? 0,
      address: json['address'] as String,
      pricePerHour: (json['pricePerHour'] as num).toDouble(),
    );

Map<String, dynamic> _$ParkingSpaceToJson(ParkingSpace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'pricePerHour': instance.pricePerHour,
    };
