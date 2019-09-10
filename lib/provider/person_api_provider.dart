import 'package:http/http.dart' as http;
import 'package:person_api_request_bloc/person.dart';

class PersonApiProvider{
  final String baseUrl = 'http://192.168.4.9:3030/';
  Future<Person> getPersons() async{
    final response = await http.get(baseUrl+'persons');
    print(response.statusCode);

    if(response.statusCode == 200){
      print(response.body);
      return personFromJson(response.body);
    }else{
      throw Exception('Failed to Load Post');
    }
  }

}