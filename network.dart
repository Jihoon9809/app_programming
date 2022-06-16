import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  Network(this.url); //인스턴스가 생성될때 생성자를 통해 url을 받음

  //json의 데이터 타입이 다양하므로 dynamic설정
  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url)); //문법 변경됨
    if (response.statusCode == 200) {
      String jsonData = response.body; //다운받은 데이터를 jsonData로 저장.
      var parsingData = jsonDecode(jsonData); // 데이터 파싱
      return parsingData;
    }
  }
}
