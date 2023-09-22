import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getApi(String nomeCidade) async {
  try {
    var url = Uri.parse(
        'https://weather.contrateumdev.com.br/api/weather/city/?city=$nomeCidade');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Erro ao carregar os dados da API');
    }
  } catch (e) {
    throw Exception('Erro ao carregar os dados da API: $e');
  }
}
