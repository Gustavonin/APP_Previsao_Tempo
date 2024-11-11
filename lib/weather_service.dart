import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiUrl = 'https://demo3520525.mockable.io/previsao';

  Future<Map<String, dynamic>> getWeather(String city) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?cidade=$city'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Erro ao buscar os dados da previsão');
      }
    } catch (e) {
      throw Exception('Falha na conexão: $e');
    }
  }
}
