part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object> get props => [];
}

// Event akan mengubah state

// Login
class LoginEvent extends PersonEvent {
  final String username;
  final String password;

  const LoginEvent(this.username, this.password);

  // selalu menggunakan perbandingan
  @override
  List<Object> get props => [username, password];
}

// Logout
// megubah PersonLoaded ke PersonInitial
class LogoutEvent extends PersonEvent {}

// Add age
// ada perubahan dari umur person lama
class AddAgeEvent extends PersonEvent {
  final int age;

  const AddAgeEvent(this.age);

  @override
  List<Object> get props => [age];
}

// Change name
class UpdateNameEvent extends PersonEvent {
  final String name;

  const UpdateNameEvent(this.name);

  @override
  List<Object> get props => [name];
}
