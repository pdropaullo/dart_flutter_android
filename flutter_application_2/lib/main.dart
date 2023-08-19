import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

PageController pageController = PageController();
int paginaAtual = 0;
int contador = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedro Paulo de Abreu'),
      ),
      body: PageView(
        controller: pageController,
        children: [
          Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: 400,
                height: 200,
                color: Colors.orange,
              ),
            ]),
          ),
          Container(
            child: Column(children: [
              SizedBox(height: 20),
              Container(
                width: 400,
                height: 100,
                color: Colors.orange,
              ),
              SizedBox(height: 20),
              Container(
                width: 400,
                height: 100,
                color: Colors.orange,
              ),
              SizedBox(height: 20),
              Container(
                width: 400,
                height: 100,
                color: Colors.orange,
              ),
              SizedBox(height: 20),
              Container(
                width: 400,
                height: 100,
                color: Colors.orange,
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: paginaAtual,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          onTap: (page) {
            pageController.animateToPage(page,
                duration: Duration(milliseconds: 200), curve: Curves.ease);
            setState(() {
              paginaAtual = page;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favortios',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Buscar',
            ),
          ]),
    );
  }
}
