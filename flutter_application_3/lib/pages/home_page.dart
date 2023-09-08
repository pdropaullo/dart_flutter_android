import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/SecondPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// var nomeUsuario = 'Pedro';
var request = {
  'nome': 'Arlindo',
  'idade': '22',
  'profissao': 'Dev Front-End',
  'salario': '12000'
};

TextEditingController nomeController = TextEditingController();
TextEditingController sobrenomeController = TextEditingController();
List<String> nomes = [];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: sobrenomeController,
              decoration: InputDecoration(labelText: 'Sobrenome'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nomes.add(nomeController.text.toUpperCase() +
                      ' ' +
                      sobrenomeController.text.toUpperCase());
                  nomeController.clear();
                  sobrenomeController.clear();
                });
              },
              child: Text('Adicionar'),
            ),
            SizedBox(height: 20),
            Container(
              height: 250,
              child: ListView.builder(
                itemCount: nomes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(nomes[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // showDialog(
                        // context: context,
                        // builder: (BuildContext context) {
                        //   return Confirmacao();
                        // });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        SecondPage(request: request),
                  ),
                );
              },
              child: Text('Próxima Página'),
            ),
          ],
        ),
      ),
    );
  }
}
