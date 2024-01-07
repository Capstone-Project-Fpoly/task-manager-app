import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_manager/shared/env/env_model.dart';
import 'package:task_manager/base/dependency/local_storage/local_storage_service.dart';
import 'package:task_manager/base/dependency/graphql/link/http_timeout_link.dart';

class GraphQLService {
  final Ref ref;
  final _httpLink = HttpLink(EnvModel.graphQLEndpoint);

  final _timeoutLink = TimeoutLink(
    requestTimeout: const Duration(seconds: 10),
  );

  final _hiveStore = HiveStore();

  final LocalStorageService localStorage;

  final tokenSubject = BehaviorSubject<String>.seeded('');
  final pauseWebsocketConnectionSubject =
      BehaviorSubject<ToggleConnectionState>.seeded(
    ToggleConnectionState.connect,
  );

  late final clientSubject =
      BehaviorSubject<GraphQLClient>.seeded(buildGraphQLClientWithToken(''));

  late final clientValueNotifier = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: GraphQLCache(store: _hiveStore),
      link: _httpLink,
    ),
  );

  GraphQLClient get client => clientSubject.value;

  void dispose() {
    clientSubject.close();
    tokenSubject.close();
    pauseWebsocketConnectionSubject.close();
  }

  GraphQLService(
    this.ref, {
    required this.localStorage,
  }) {
    clientSubject.listen((_) {
      clientValueNotifier.value = clientSubject.value;
    });
  }

  void updateGraphQLClientWithToken(String token) {
    clientSubject.value = buildGraphQLClientWithToken(token);
    tokenSubject.value = token;
  }

  GraphQLClient buildGraphQLClientWithToken(String token) {
    final authLink = AuthLink(getToken: () => 'Bearer $token');
    final webSocketLink = WebSocketLink(
      EnvModel.graphQLEndpointWs,
      config: SocketClientConfig(
        initialPayload: {'Authorization': 'Bearer $token'},
        autoReconnect: true,
        inactivityTimeout: const Duration(hours: 1),
        queryAndMutationTimeout: const Duration(seconds: 30),
        // toggleConnection: pauseWebsocketConnectionSubject,
      ),
      subProtocol: GraphQLProtocol.graphqlTransportWs,
    );
    final url = Link.split(
      (request) => request.isSubscription,
      webSocketLink,
      Link.from([
        authLink,
        _timeoutLink,
        _httpLink,
      ]),
    );
    final client = GraphQLClient(
      defaultPolicies: DefaultPolicies(
        query: Policies(
          fetch: FetchPolicy.networkOnly,
        ),
        mutate: Policies(
          fetch: FetchPolicy.networkOnly,
        ),
        subscribe: Policies(
          fetch: FetchPolicy.networkOnly,
        ),
      ),
      cache: GraphQLCache(),
      link: url,
    );
    return client;
  }
}
