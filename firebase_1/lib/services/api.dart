import 'dart:convert';
import 'package:http/http.dart' as http;

class NameModel {
  final String key;
  final String name;
  NameModel({required this.key, required this.name});
}

Future<void> loadNames() async {
  var url = Uri.parse(
      'https://crud-ads-90909-default-rtdb.firebaseio.com/names.json');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<NameModel> names = [];
    data.forEach((key, value) {
      names.add(NameModel(key: key, name: value['name']));
    });
    // setState(() {
    //   _names.clear();
    //   _names.addAll(names);
    // });
  }
}

Future<void> addName(String name) async {
  var url = Uri.parse(
      'https://crud-ads-90909-default-rtdb.firebaseio.com/names.json');
  var data = {
    'name': name,
  };
  var response = await http.post(url, body: json.encode(data));
  if (response.statusCode == 200) {
    print('Nome salvo com sucesso no Firebase.');
    loadNames(); // Recarregue a lista após a adição
  } else {
    print('Erro ao salvar nome no Firebase.');
  }
}

Future<void> deleteName(String key) async {
  var url =
      Uri.parse('https://crud-ads-90909-default-rtdb.firebaseio.com/$key.json');
  var response = await http.delete(url);
  if (response.statusCode == 200) {
    print('Nome excluído com sucesso no Firebase.');
    loadNames(); // Recarregue a lista após a exclusão
  } else {
    print('Erro ao excluir nome no Firebase.');
  }
}

// getContacts() async {
//   var url =
//       Uri.parse('https://crud-ads-90909-default-rtdb.firebaseio.com/.json');
//   var req = await http.get(url);
//   print(req.body);
// }

// postContacts() async {
//   var url = Uri.parse(
//       'https://crud-ads-90909-default-rtdb.firebaseio.com/product/.json');
//   var data = {'name': 'Bola', 'price': '29.90', 'description': 'lorem'};
//   var req = await http.post(url, body: json.encode(data));
//   print(req.statusCode);
// }

// deleteContacts(String id) async {
//   var url = Uri.parse(
//       'https://crud-ads-90909-default-rtdb.firebaseio.com/pessoa/$id/.json');
//   var req = await http.delete(url);
//   print(req.statusCode);
// }

// patchContacts() async {
//   var url = Uri.parse(
//       'https://crud-ads-90909-default-rtdb.firebaseio.com/product/-NhEHJJf7I2RliiLXxEC/.json');
//   var data = {'name': 'Bola'};
//   var req = await http.patch(url, body: json.encode(data));
//   print(req.statusCode);
// }

// putContacts() async {
//   var url = Uri.parse(
//       'https://crud-ads-90909-default-rtdb.firebaseio.com/product/-MjXZQZ3Z3Z3Z3Z3Z3Z3/.json');
//   var data = {'name': 'Bola', 'price': '29.90', 'description': 'lorem'};
//   var req = await http.put(url, body: json.encode(data));
//   print(req.statusCode);
// }