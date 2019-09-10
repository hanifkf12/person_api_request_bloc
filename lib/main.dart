import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_api_request_bloc/person.dart';
import 'package:person_api_request_bloc/person/bloc.dart';
import 'package:person_api_request_bloc/person/person_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<PersonBloc>(
          builder: (context) => PersonBloc(),
          child: MyHomePage(title: 'API BLOC')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final personBloc = BlocProvider.of<PersonBloc>(context);
    personBloc.dispatch(GetPersons());
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Container(
          child: BlocBuilder<PersonBloc, PersonState>(
            builder: (context, state) {
              if (state is PersonLoading) {
                return buildLoading();
              } else if (state is PersonLoaded) {
                return buildList(state.person);
              }
            },
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildList(Person person) {
    return ListView.builder(
      itemBuilder: (builder, index) {
        return ListTile(
          title: Text(person.result[index].firstName),
          subtitle: Text(person.result[index].lastName),
        );
      },
      itemCount: person.count,
    );
  }
}
