import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_api_request_bloc/person/bloc.dart';
import 'package:person_api_request_bloc/person/save_person.dart';

class SecondPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Person'),
        centerTitle: true,
      ),
      body: BlocProvider<PersonBloc>(
        builder: (context) => PersonBloc(),
        child: FormAddPerson()
      ),
    );
  }
}

class FormAddPerson extends StatelessWidget {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<PersonBloc, PersonState>(
        builder: (context, state){
          if(state is InitialPersonState){
            return addForm(context);
          }
          else if(state is PersonLoading){
            return buildLoading();
          }else if (state is PersonAdded){
            if(state.status){
              Navigator.pop(context);
              return buildLoading();
            }
          }
        },

      ),
    );
  }
  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  Widget addForm(context){
    final bloc= BlocProvider.of<PersonBloc>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: controller1,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: 'Nama Depan',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: controller2,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: 'Nama Belakang',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text('SIMPAN'),
            color: Colors.green,
            textColor: Colors.white,
            highlightColor: Colors.blue,
            onPressed: () {
              SavePerson savePerson = SavePerson(firstName: controller1.text, lastname: controller2.text);
              controller1.clear();
              controller2.clear();
              bloc.dispatch(CreatePerson(savePerson));
            },
          )
        ],
      ),
    );
  }
}

