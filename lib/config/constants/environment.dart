import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment(String s) async {
    await dotenv.load(fileName: '.env');
  }

  static String url = dotenv.env['URL'] ?? 'No está configurado el API_URL';
  static String key = dotenv.env['ANONKEY'] ?? 'Falta api key';
}
