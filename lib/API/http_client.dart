import 'package:http/http.dart' as http;

abstract class IHttpClient {
  get({required String url});
}

class HttpClient extends IHttpClient {
  final client = http.Client();

  @override
  get({required String url}) async {
    return await client.get(Uri.parse(url));
  }

  getWithHeader({required String url, Map<String, String>? headers}) async {
    return await client.get(Uri.parse(url), headers: headers);
  }
}
