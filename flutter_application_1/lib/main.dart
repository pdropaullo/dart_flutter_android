import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

PageController pageController = PageController();
int paginaAtual = 0;

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
      body: PageView(
        controller: pageController,
        children: [
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
        ],
      ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     Container(
      //       // width: MediaQuery.of(context).size.width * .5,
      //       width: double.infinity,
      //       height: 200,
      //       // color: Colors.blue,
      //       decoration: BoxDecoration(
      //         color: Colors.blue,
      //         borderRadius: BorderRadius.circular(10),
      //         gradient: LinearGradient(
      //           colors: [Colors.red, Colors.blue],
      //           begin: Alignment.topLeft,
      //           end: Alignment.bottomRight,
      //         ),
      //       ),
      //       // margin: EdgeInsets.only(top: 20, left: 10),
      //       // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //       child: Text('Container 1'),
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Container(
      //           width: 100,
      //           height: 100,
      //           color: Colors.red,
      //           child: Text('Container 2'),
      //         ),
      //         Container(
      //           width: 100,
      //           height: 100,
      //           color: Colors.green,
      //           child: Text('Container 3'),
      //         ),
      //         Container(
      //           width: 100,
      //           height: 100,
      //           color: Colors.yellow,
      //           child: Text('Container 4'),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
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
    );
  }
}
