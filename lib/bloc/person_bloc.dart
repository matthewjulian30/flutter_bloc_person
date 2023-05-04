import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/person.dart';
import '../data/person_repository.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  // meminta super(PersonInitial())
  // meminta awalan
  PersonBloc() : super(PersonInitial()) {
    // on<PersonEvent> ketika terjadi
    on<PersonEvent>((event, emit) async {
      // Login
      if (event is LoginEvent && state is PersonInitial) {
        // emit mengirimkan nilai atau status baru
        emit(PersonLoading());
        Person p =
            await PersonRepository().login(event.username, event.password);
        emit(PersonLoaded(p));
        // Logout
      } else if (event is LogoutEvent) {
        emit(PersonInitial());
        // Add age
        // ketika statenya adalah PersonLoaded dan
        // ketika eventnya adalah AddAgeEvent
      } else if (event is AddAgeEvent && state is PersonLoaded) {
        log('age added');
        Person p = (state as PersonLoaded).person;
        emit(PersonLoaded(p.copyWith(age: p.age + 1)));
        // Change name
      } else if (event is UpdateNameEvent && state is PersonLoaded) {
        log('name changed');
        Person p = (state as PersonLoaded).person;
        emit(PersonLoaded(p.copyWith(name: event.name)));
      }
    });
  }
}
