import 'package:flutter/material.dart';

import '../components/dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController nomeController = TextEditingController();
TextEditingController sobrenomeController = TextEditingController();
String nome = '';
String sobrenome = '';
List nomes = [];

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
              decoration: InputDecoration(
                labelText: 'Nome',
                // prefixIcon: Icon(Icons.person),
              ),
            ),
            TextField(
              controller: sobrenomeController,
              decoration: InputDecoration(
                labelText: 'Sobrenome',
                // suffixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // onPressed: () {
              //   setState(() {
              //     nome = nomeController.text;
              //     sobrenome = sobrenomeController.text;
              //     nomeController.clear();
              //     sobrenomeController.clear();
              //   });
              // },
              onPressed: () {
                setState(() {
                  nomes.add(
                      nomeController.text + ' ' + sobrenomeController.text);
                  nomeController.clear();
                  sobrenomeController.clear();
                });
              },
              child: Text('Adicionar'),
            ),
            SizedBox(height: 20),
            // Text(
            //   'Nome Completo: $nome $sobrenome',
            //   style: TextStyle(fontSize: 20),
            // ),
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: nomes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(nomes[index]),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red, // Defina a cor vermelha (red) aqui
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Confirmacao();
                            });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
