import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiSarvice {
  Future<String?> getData() async {
    String apidata =
        'https://api.weatherapi.com/v1/current.json?key=9885c92eb56e4e0596d103301241906&q=surat';
    Uri uri = Uri.parse(apidata);
    Response response = await http.get(uri);
    if (response.statusCode == 200) {
      print('Api Called');
      return response.body;
    } else {
      return null;
    }
  }
}
