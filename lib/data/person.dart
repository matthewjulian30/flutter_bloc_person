import 'package:equatable/equatable.dart';

class Person extends Equatable {
  String name;
  int age;

  Person({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];

  // mengcopy class Person
  // sehingga dapat mengubah name atau agenya
  Person copyWith({String? name, int? age}) =>
      Person(name: name ?? this.name, age: age ?? this.age);
}
