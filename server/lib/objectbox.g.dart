// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;

import 'models/parking.dart';
import 'models/parking_space.dart';
import 'models/person.dart';
import 'models/vehicle.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 943279947556535329),
      name: 'Person',
      lastPropertyId: const obx_int.IdUid(3, 6484425345498852088),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 7203322164992241926),
            name: 'id',
            type: 6,
            flags: 129),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 2740844848237197067),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 6484425345498852088),
            name: 'personalNumber',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 8358509318711564757),
      name: 'Parking',
      lastPropertyId: const obx_int.IdUid(5, 6332364656735981926),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 441969262440836665),
            name: 'id',
            type: 6,
            flags: 129),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 6213154880685249047),
            name: 'startTime',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 8542694961106590673),
            name: 'endTime',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 2949277621826755109),
            name: 'vehicleId',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 6332364656735981926),
            name: 'parkingSpaceId',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 3548334541488051048),
      name: 'ParkingSpace',
      lastPropertyId: const obx_int.IdUid(3, 1769443086790588010),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 19068802490370764),
            name: 'id',
            type: 6,
            flags: 129),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 5415443554363575426),
            name: 'address',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1769443086790588010),
            name: 'pricePerHour',
            type: 8,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(4, 1579564579437055289),
      name: 'Vehicle',
      lastPropertyId: const obx_int.IdUid(4, 3149063790746449237),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 6216588109778152407),
            name: 'id',
            type: 6,
            flags: 129),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 8813399690601092408),
            name: 'registrationNumber',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5867564324134321390),
            name: 'type',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 3149063790746449237),
            name: 'ownerId',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
obx.Store openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) {
  return obx.Store(getObjectBoxModel(),
      directory: directory,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(4, 1579564579437055289),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    Person: obx_int.EntityDefinition<Person>(
        model: _entities[0],
        toOneRelations: (Person object) => [],
        toManyRelations: (Person object) => {},
        getId: (Person object) => object.id,
        setId: (Person object, int id) {
          object.id = id;
        },
        objectToFB: (Person object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final personalNumberOffset = fbb.writeString(object.personalNumber);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, personalNumberOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final personalNumberParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final object = Person(
              id: idParam,
              name: nameParam,
              personalNumber: personalNumberParam);

          return object;
        }),
    Parking: obx_int.EntityDefinition<Parking>(
        model: _entities[1],
        toOneRelations: (Parking object) => [],
        toManyRelations: (Parking object) => {},
        getId: (Parking object) => object.id,
        setId: (Parking object, int id) {
          object.id = id;
        },
        objectToFB: (Parking object, fb.Builder fbb) {
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.startTime.millisecondsSinceEpoch);
          fbb.addInt64(2, object.endTime?.millisecondsSinceEpoch);
          fbb.addInt64(3, object.vehicleId);
          fbb.addInt64(4, object.parkingSpaceId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final endTimeValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final vehicleIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final parkingSpaceIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final startTimeParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0));
          final endTimeParam = endTimeValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(endTimeValue);
          final object = Parking(
              id: idParam,
              vehicleId: vehicleIdParam,
              parkingSpaceId: parkingSpaceIdParam,
              startTime: startTimeParam,
              endTime: endTimeParam);

          return object;
        }),
    ParkingSpace: obx_int.EntityDefinition<ParkingSpace>(
        model: _entities[2],
        toOneRelations: (ParkingSpace object) => [],
        toManyRelations: (ParkingSpace object) => {},
        getId: (ParkingSpace object) => object.id,
        setId: (ParkingSpace object, int id) {
          object.id = id;
        },
        objectToFB: (ParkingSpace object, fb.Builder fbb) {
          final addressOffset = fbb.writeString(object.address);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, addressOffset);
          fbb.addFloat64(2, object.pricePerHour);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final addressParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final pricePerHourParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final object = ParkingSpace(
              id: idParam,
              address: addressParam,
              pricePerHour: pricePerHourParam);

          return object;
        }),
    Vehicle: obx_int.EntityDefinition<Vehicle>(
        model: _entities[3],
        toOneRelations: (Vehicle object) => [],
        toManyRelations: (Vehicle object) => {},
        getId: (Vehicle object) => object.id,
        setId: (Vehicle object, int id) {
          object.id = id;
        },
        objectToFB: (Vehicle object, fb.Builder fbb) {
          final registrationNumberOffset =
              fbb.writeString(object.registrationNumber);
          final typeOffset = fbb.writeString(object.type);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, registrationNumberOffset);
          fbb.addOffset(2, typeOffset);
          fbb.addInt64(3, object.ownerId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final registrationNumberParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, '');
          final typeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final ownerIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final object = Vehicle(
              id: idParam,
              registrationNumber: registrationNumberParam,
              type: typeParam,
              ownerId: ownerIdParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Person] entity fields to define ObjectBox queries.
class Person_ {
  /// See [Person.id].
  static final id =
      obx.QueryIntegerProperty<Person>(_entities[0].properties[0]);

  /// See [Person.name].
  static final name =
      obx.QueryStringProperty<Person>(_entities[0].properties[1]);

  /// See [Person.personalNumber].
  static final personalNumber =
      obx.QueryStringProperty<Person>(_entities[0].properties[2]);
}

/// [Parking] entity fields to define ObjectBox queries.
class Parking_ {
  /// See [Parking.id].
  static final id =
      obx.QueryIntegerProperty<Parking>(_entities[1].properties[0]);

  /// See [Parking.startTime].
  static final startTime =
      obx.QueryDateProperty<Parking>(_entities[1].properties[1]);

  /// See [Parking.endTime].
  static final endTime =
      obx.QueryDateProperty<Parking>(_entities[1].properties[2]);

  /// See [Parking.vehicleId].
  static final vehicleId =
      obx.QueryIntegerProperty<Parking>(_entities[1].properties[3]);

  /// See [Parking.parkingSpaceId].
  static final parkingSpaceId =
      obx.QueryIntegerProperty<Parking>(_entities[1].properties[4]);
}

/// [ParkingSpace] entity fields to define ObjectBox queries.
class ParkingSpace_ {
  /// See [ParkingSpace.id].
  static final id =
      obx.QueryIntegerProperty<ParkingSpace>(_entities[2].properties[0]);

  /// See [ParkingSpace.address].
  static final address =
      obx.QueryStringProperty<ParkingSpace>(_entities[2].properties[1]);

  /// See [ParkingSpace.pricePerHour].
  static final pricePerHour =
      obx.QueryDoubleProperty<ParkingSpace>(_entities[2].properties[2]);
}

/// [Vehicle] entity fields to define ObjectBox queries.
class Vehicle_ {
  /// See [Vehicle.id].
  static final id =
      obx.QueryIntegerProperty<Vehicle>(_entities[3].properties[0]);

  /// See [Vehicle.registrationNumber].
  static final registrationNumber =
      obx.QueryStringProperty<Vehicle>(_entities[3].properties[1]);

  /// See [Vehicle.type].
  static final type =
      obx.QueryStringProperty<Vehicle>(_entities[3].properties[2]);

  /// See [Vehicle.ownerId].
  static final ownerId =
      obx.QueryIntegerProperty<Vehicle>(_entities[3].properties[3]);
}
