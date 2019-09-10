import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../person.dart';

@immutable
abstract class PersonState extends Equatable {
  PersonState([List props = const[]]) : super(props);
}

class InitialPersonState extends PersonState {}

class PersonLoading extends PersonState{}

class PersonLoaded extends PersonState{
  Person person;

  PersonLoaded(this.person) : super([person]);
}
