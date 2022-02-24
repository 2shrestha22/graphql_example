import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_example/home/country.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const contries = '''{
  countries{
    name,
    code,
    phone,
    capital,
    emoji,
  }
}''';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Query<List<Country>>(
        options: QueryOptions(
          document: gql(contries),
          parserFn: (json) {
            log(json.toString());
            return (json["countries"] as List)
                .map((e) => Country.fromJson(e))
                .toList();
          },
        ),
        builder: (res, {fetchMore, refetch}) {
          if (res.parsedData != null) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final country = res.parsedData![index];

                return ListTile(
                  title: Text(country.name),
                  subtitle: Text(country.capital ?? 'n/a'),
                  leading: Text(country.emoji),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
