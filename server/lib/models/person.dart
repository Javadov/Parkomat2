import 'package:objectbox/objectbox.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
@Entity()
class Person {
  @Id(assignable: true)
  int id;
  String name;
  String personalNumber;

  Person({this.id = 0, required this.name, required this.personalNumber});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
