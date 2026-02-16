import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String baseApiUrl = dotenv.env['BASE_URL'] ?? '';
  static String baseImageUrl = dotenv.env['BASE_IMAGE_URL'] ?? '';
}