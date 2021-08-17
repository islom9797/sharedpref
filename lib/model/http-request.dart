import 'package:http/http.dart';

class Network {
  static String BASE = 'api.github.com';
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8'
  };

  ///http API
  static String API_LIST = "/users/islom9797";

  ///http request
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);

    ///uri bu httpsni yegib beradi bitta qilib
    var response = await get(uri, headers: headers);

    ///bu yerda get so'zi get usulida serverda malumotlarni jonatadi va await yozganimiz un kutub turib response ni oladi
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

/*http parameters*/
  static Map<String, String> paramEmpty() {
    Map<String,String> params=new Map();
    return params;
  }
}