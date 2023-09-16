import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_4/components/getapi.dart';
import 'package:flutter_application_4/pages/moreInfo.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: FutureBuilder(
        future: getApi(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            Center(
              child: Text('Tente novamente mais tarde'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoreInfo(
                        request: snapshot.data[index],
                      ),
                    ),
                  );
                },
                title: Text(snapshot.data[index]['name']),
                subtitle: Text(snapshot.data[index]['company']),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data[index]['photo']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
