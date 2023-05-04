import 'person.dart';

class PersonRepository {
  Future<Person> login(String username, String password) async {
    // ...
    await Future.delayed(const Duration(seconds: 3));

    return Person(name: username, age: 0);
  }
}
