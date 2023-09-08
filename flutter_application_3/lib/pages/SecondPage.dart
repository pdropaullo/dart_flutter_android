import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  // String nome;
  Map request;

  SecondPage({super.key, required this.request});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.request['nome']),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Nome: ${widget.request['nome']}'),
            Text('Idade: ${widget.request['idade']}'),
            Text('Profissão: ${widget.request['profissao']}'),
            Text('Salário: ${widget.request['salario']}'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar para a primeira página'),
            ),
          ],
        ),
      ),
    );
  }
}
