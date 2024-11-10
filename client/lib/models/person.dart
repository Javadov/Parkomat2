import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  int id;
  String name;
  String personalNumber;

  Person({required this.id, required this.name, required this.personalNumber});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  String toString() => 'ID: $id, Name: $name, Personal Number: $personalNumber';
}