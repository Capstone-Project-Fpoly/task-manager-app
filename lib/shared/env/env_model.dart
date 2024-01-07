import 'package:envied/envied.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@Envied(path: '.env.local')
abstract class EnvModel {
  @EnviedField(varName: 'BASE_URL', defaultValue: '')
  static String baseUrl = dotenv.env['BASE_URL'] ?? '';

  static String graphQLEndpoint = '$baseUrl/graphql';

  static final graphQLEndpointWs =
      EnvModel.graphQLEndpoint.replaceFirst('http', 'ws');
}
