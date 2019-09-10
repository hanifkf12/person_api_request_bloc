

import 'package:person_api_request_bloc/person.dart';
import 'package:person_api_request_bloc/provider/person_api_provider.dart';

class PersonRepository{
  final _provider = PersonApiProvider();

  Future<Person> fetchPersons() => _provider.getPersons();
}