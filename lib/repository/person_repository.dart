

import 'package:person_api_request_bloc/person.dart';
import 'package:person_api_request_bloc/person/save_person.dart';
import 'package:person_api_request_bloc/provider/person_api_provider.dart';

class PersonRepository{
  final _provider = PersonApiProvider();

  Future<Person> fetchPersons() => _provider.getPersons();

  Future<bool> createPersons(SavePerson savePerson) => _provider.createPersons(savePerson);
}