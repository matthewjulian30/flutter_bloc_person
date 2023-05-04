part of 'person_bloc.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object> get props => [];
}

// Sebelum Login
// belum ada person
class PersonInitial extends PersonState {}

// Loading Setelah Login
// lagi proses ngambil data
class PersonLoading extends PersonState {}

// Sudah Login
// datanya sudah terambil
// ada datanya berupa person
class PersonLoaded extends PersonState {
  final Person person;

  const PersonLoaded(this.person);

  // perlu untuk membandingkan person
  // mengecek jika berupa person yg sama
  // update ketika personnya beda
  @override
  List<Object> get props => [person];
}
