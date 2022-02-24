import 'package:flutter/material.dart';
import 'package:graphql_example/main.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ClientProvider extends StatelessWidget {
  const ClientProvider({
    Key? key,
    required this.child,
    this.subscriptionEndpoint,
    required this.graphqlEndpoint,
  }) : super(key: key);

  final Widget child;
  final String? subscriptionEndpoint;
  final String graphqlEndpoint;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: getClient(
        uri: graphqlEndpoint,
        subscriptionUri: subscriptionEndpoint,
      ),
      child: child,
    );
  }
}

ValueNotifier<GraphQLClient> getClient({
  required String uri,
  String? subscriptionUri,
}) {
  final Link link;
  if (subscriptionUri != null) {
    link = Link.split(
      (request) => request.isSubscription,
      WebSocketLink(subscriptionUri),
      HttpLink(uri),
    );
  } else {
    link = HttpLink(graphqlEndpoint);
  }

  return ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
}
