import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  // ignore: non_constant_identifier_names
  static String api_key = dotenv.env['API_KEY']!;
  static String apiapple =
      'https://newsapi.org/v2/everything?q=apple&from=2022-03-14&to=2022-03-14&sortBy=popularity&apiKey=$api_key';
  static String apitestla =
      'https://newsapi.org/v2/everything?q=tesla&from=2022-02-15&sortBy=publishedAt&apiKey=$api_key';
  static String apibuisness =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$api_key';
  static String apiheadline =
      'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$api_key';
  static String wallstreetJournal =
      'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$api_key';
}
