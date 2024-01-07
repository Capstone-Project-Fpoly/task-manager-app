import 'package:graphql_flutter/graphql_flutter.dart';

class TimeoutLink extends Link {
  final Duration requestTimeout;

  TimeoutLink({
    this.requestTimeout = const Duration(seconds: 10),
  });

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    final stream = forward!(request).timeout(
      requestTimeout,
      onTimeout: (sink) {
        sink.addError(
          OperationException(
            graphqlErrors: [
              const GraphQLError(
                message: 'Request timed out',
              ),
            ],
          ),
        );
      },
    );
    yield* stream;
  }
}
