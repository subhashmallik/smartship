import 'package:smartshipapp/config/server_addresses.dart';
import 'package:smartshipapp/config/storage.dart';

class HttpClient {
  Map createHeader() {
    var header = <String, String>{
      'authorization': 'Bearer ' + Storage().token,
    };
    return header;
  }

  Uri createUri(String route, [Map<String, String> param = const {}]) {
    return Uri(
      scheme: 'http',
      host: ServerAddresses.serverAddress,
      path: route,
      queryParameters: param,
    );
  }
}
