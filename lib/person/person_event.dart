import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:person_api_request_bloc/person/bloc.dart';
import 'package:person_api_request_bloc/person/save_person.dart';

@immutable
abstract class PersonEvent extends Equatable{
  PersonEvent([List props = const []]) : super(props);
}

class GetPersons extends PersonEvent{

  @override
  String toString() {
    "Get Persons";
  }
}

class CreatePerson extends PersonEvent{
  SavePerson savePerson;

  CreatePerson(this.savePerson) : super([savePerson]);
}
