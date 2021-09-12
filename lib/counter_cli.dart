import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const String HostServer = "localhost";
const String HostPort = "8083";

Future<int> fetchCounter(String Operation) async {
  print("Open Firewall Port form Systemctl stop firewall");

  print('Getting Counter');
  var url =
      new Uri.http(HostServer  +":"+HostPort, "counter/" + Operation); // working web client
  print("GET -----" + url.toString() + "--------");
  var client = http.Client();
  http.Response response = await client.get(url);

  print("returned " + response.body.toString());
  if (response.statusCode == 200) {
    return (int.parse(response.body));
  } else {
    throw Exception('Failed to load Counter');
  }
}

Future<int> setCounter(String setvalue) async {
  print("Open Firewall Port form Systemctl stop firewall");

  print('Setting Counter to 999');
  var url = new Uri.http(HostServer +":"+HostPort, "counter/set/"); // working web client
  print("POST -----" + url.toString() + "--------");

  var client = http.Client();
  http.Response response = await client.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'counter': setvalue,
    }),
  );
  print("returned " + response.body.toString());
  if (response.statusCode == 200) {
    return (int.parse(response.body));
  } else {
    throw Exception('Failed to load Counter');
  }
}
