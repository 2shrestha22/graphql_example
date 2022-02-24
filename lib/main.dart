import 'package:flutter/material.dart';
import 'package:graphql_example/client/client.dart';
import 'package:graphql_example/home/home_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const graphqlEndpoint = 'https://countries.trevorblades.com/';

void main() async {
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClientProvider(
      graphqlEndpoint: graphqlEndpoint,
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
