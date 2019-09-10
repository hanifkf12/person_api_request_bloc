import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
