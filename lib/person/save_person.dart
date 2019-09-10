
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SavePerson extends Equatable{
  String firstName;
  String lastname;

  SavePerson({@required this.firstName, @required this.lastname}) : super([firstName, lastname]);



}