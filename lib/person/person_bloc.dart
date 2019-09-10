import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:person_api_request_bloc/repository/person_repository.dart';
import '../person.dart';
import './bloc.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final _repository = PersonRepository();
  @override
  PersonState get initialState => InitialPersonState();

  @override
  Stream<PersonState> mapEventToState(
    PersonEvent event,
  ) async* {
    if (event is GetPersons){
      yield PersonLoading();
      Person person = await _repository.fetchPersons();
      yield PersonLoaded(person);
    }else if(event is CreatePerson){
      yield PersonLoading();
      bool status = await _repository.createPersons(event.savePerson);
      yield PersonAdded(status);
    }
  }
}
