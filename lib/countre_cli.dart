import 'dart:async';
import 'package:http/http.dart' as http;

Future<int> fetchCounter(String Operation) async {
  print('Getting Counter');
  var url = new Uri.http("localhost:8083", "counter/"+Operation); // working web client
  print(url);
  var client = http.Client();
  http.Response response = await client.get(url);
  print("returned " +  response.body.toString());
  if (response.statusCode == 200) {
    return  (int.parse(  response.body));
  } else {
    throw Exception('Failed to load Counter');

  }
}