import 'package:flutter/material.dart';
import 'package:prova_22_08/pages/previsaoTempo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://www.visse.com.br/wp-content/uploads/2020/02/previsao-tempo-marataizes-1-1024x576-1.jpg',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Login',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => PrevisaoTempo(),
                    ),
                  );
                },
                child: Text('Entrar'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(FontAwesomeIcons.link),
                    onPressed: () {
                      const url = 'https://linktr.ee/pdropaullo';
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.linkedin),
                    onPressed: () {
                      const url = 'https://www.linkedin.com/in/pdropaullo/';
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.github),
                    onPressed: () {
                      const url = 'https://github.com/pdropaullo';
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
