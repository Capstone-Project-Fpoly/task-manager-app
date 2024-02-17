import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvModel {
  static String baseUrl = dotenv.env['BASE_URL'] ?? '';

  static String graphQLEndpoint = '$baseUrl/graphql';

  static final graphQLEndpointWs =
      EnvModel.graphQLEndpoint.replaceFirst('http', 'ws');
}
