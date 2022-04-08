import 'package:http/http.dart' as http;
import 'dart:convert';


class NewsFeed{
 static String apiKey = 'pub_62236ef8143843f96a0991d962db3bd92988';

 static Future<List<Map<String, dynamic>>> getNews()async{
   Uri url = Uri(
      scheme: 'https',
      host: 'newsdata.io',
      pathSegments: [
        'api',
        '1',
        'news',
      ],
      queryParameters: {
        'q': 'economics OR finance OR business',
        'apikey': apiKey,
        'language': 'en',
      }
    );
    http.Response response = await http.get(url);
    Map body = jsonDecode(response.body);
    List<Map<String, dynamic>> news = List<Map<String, dynamic>>.from(body['results']);
    return news;

 }
}