import 'package:flutter/material.dart';

class Confirmacao extends StatefulWidget {
  const Confirmacao({super.key});

  @override
  State<Confirmacao> createState() => _ConfirmacaoState();
}

class _ConfirmacaoState extends State<Confirmacao> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Excluir'),
      content: Text('Deseja excluir o item?'),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              // nomes.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Item removido'),
                duration: Duration(seconds: 3),
              ),
            );
            Navigator.of(context).pop();
          },
          child: Text('Sim'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Não'),
        ),
      ],
    );
  }
}
