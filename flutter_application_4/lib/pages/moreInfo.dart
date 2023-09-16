import 'package:flutter/material.dart';

class MoreInfo extends StatefulWidget {
  Map request;

  MoreInfo({super.key, required this.request});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  Color getBackgroundColor(String gender) {
    if (gender == 'male') {
      return Colors.lightBlue;
    } else {
      return Colors.pinkAccent;
    }
  }

  String getGenderText(String gender) {
    if (gender == 'male') {
      return 'Masculino';
    } else {
      return 'Feminino';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.request['name']),
      ),
      body: Container(
        color: getBackgroundColor(widget.request['gender']),
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Image(
                image: NetworkImage(widget.request['photo']),
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome: ${widget.request['name']}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Idade: ${widget.request['age']}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Sexo: ${getGenderText(widget.request['gender'])}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Email: ${widget.request['email']}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Empresa: ${widget.request['company']}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Voltar para lista'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
