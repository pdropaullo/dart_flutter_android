import 'dart:convert';

import 'package:http/http.dart' as http;

getUser() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  var response = await http.get(url);
  var data = jsonDecode(response.body);
  // print(data[0]);
  // print(data[0]['name']);
  // for (var user in data) {
  //   print(user['name']);
  // }

  var usuario = data.map((json) => modelUser.fromJson(json)).toList();

  for (var user in usuario) {
    print(user.nome);
    print(user.email);
    print(user.telefone);
  }
}

getPost() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  var response = await http.get(url);
  var data = jsonDecode(response.body);
  
  var post = data.map((json) => modelPost.fromJson(json)).toList();

  for (var user in post) {
    print(user.title);
    print(user.body);
  }
}

void main() {
  // getUser();
  getPost();
}

class modelUser {
  String nome;
  String email;
  String telefone;

  modelUser({required this.nome, required this.email, required this.telefone});

  factory modelUser.fromJson(Map<String, dynamic> json) {
    return modelUser(
        nome: json['name'], email: json['email'], telefone: json['phone']);
  }
}

class modelPost {
  String title;
  String body;

  modelPost({required this.title, required this.body});

  factory modelPost.fromJson(Map<String, dynamic> json) {
    return modelPost(
        title: json['title'], body: json['body']);
  }
}