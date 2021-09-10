import 'dart:async';
import 'package:http/http.dart' as http;

Future<int> fetchCounter(String Operation) async {


print( "Open Firewall Port form Systemctl stop firewall");

  print('Getting Counter');
  var url = new Uri.http("192.168.1.5:8083", "counter/"+Operation); // working web client
  print("-----" + url.toString()+"--------");
  var client = http.Client();
  http.Response response = await client.get(url);

  // var url = 'http://192.168.1.5:8083/counter/'+Operation;    // working web client
 //  final response = await http.get(Uri.parse( url));

  print("returned " +  response.body.toString());
  if (response.statusCode == 200) {
    return  (int.parse(  response.body));
  } else {
    throw Exception('Failed to load Counter');

  }
}