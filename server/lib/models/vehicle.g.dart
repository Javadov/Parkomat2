// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      id: (json['id'] as num?)?.toInt() ?? 0,
      registrationNumber: json['registrationNumber'] as String,
      type: json['type'] as String,
      ownerId: (json['ownerId'] as num).toInt(),
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'id': instance.id,
      'registrationNumber': instance.registrationNumber,
      'type': instance.type,
      'ownerId': instance.ownerId,
    };
