import 'package:http/http.dart' as http;
import 'package:person_api_request_bloc/person.dart';
import 'package:person_api_request_bloc/person/save_person.dart';

class PersonApiProvider{
  final String baseUrl = 'http://192.168.4.9:3030';
  Future<Person> getPersons() async{
    final response = await http.get('$baseUrl/persons');
    print(response.statusCode);

    if(response.statusCode == 200){
      print(response.body);
      return personFromJson(response.body);
    }else{
      throw Exception('Failed to Load Post');
    }
  }

  Future<bool> createPersons(SavePerson savePerson) async{
    final response = await http.post('$baseUrl/person',
        body: {'first_name' : savePerson.firstName,'last_name' : savePerson.lastname});
    if(response.statusCode == 201){
      print(response.body);
      return true;
    }else{
      return false;
    }
  }

}