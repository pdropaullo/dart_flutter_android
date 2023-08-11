import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
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
          title: Text('Nubank'),
          backgroundColor: Colors.purple,
          // elevation: 70,
          // centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Pedro'),
                accountEmail: Text('pedro.abreu.senac@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  // child: Text('P'),
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/103196282?v=4'),
                ),
              ),
              ListTile(
                title: Text('Minha Conta'),
                subtitle: Text('Detalhes da conta'),
                trailing: Icon(Icons.money),
                leading: Icon(Icons.account_balance_wallet),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: PageView(
          controller: pageController,
          children: [
            Center(
              child: Container(
                child: Text(
                  contador.toString(),
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: paginaAtual,
            backgroundColor: Colors.purple,
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
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (contador > 0)
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    contador--;
                  });
                },
                child: Icon(Icons.remove),
              ),
            SizedBox(
              width: 14,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  contador++;
                });
              },
              child: Icon(Icons.add),
            )
          ],
        ));
  }
}
