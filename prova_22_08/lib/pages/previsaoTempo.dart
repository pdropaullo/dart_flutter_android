import 'package:flutter/material.dart';
import 'package:prova_22_08/components/getapi.dart';

class PrevisaoTempo extends StatefulWidget {
  @override
  _PrevisaoTempoState createState() => _PrevisaoTempoState();
}

class _PrevisaoTempoState extends State<PrevisaoTempo> {
  Map<String, dynamic> previsaoTempo = {};
  TextEditingController cidadeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> carregarPrevisaoTempo() async {
    try {
      final cidade = cidadeController.text;
      final dados = await getApi(cidade);

      setState(() {
        previsaoTempo = dados;
      });
    } catch (e) {
      // Trate os erros aqui
      print('Erro ao carregar previsão do tempo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão do Tempo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: cidadeController,
            decoration: InputDecoration(
              hintText: 'Busque pela cidade...',
            ),
          ),
          ElevatedButton(
            onPressed: carregarPrevisaoTempo,
            child: Text('Buscar Previsão'),
          ),
          SizedBox(height: 20.0),
          if (previsaoTempo.isNotEmpty)
            Column(
              children: [
                Text('Cidade: ${previsaoTempo['name']}'),
                Text('Temperatura: ${previsaoTempo['main']['temp']}°C'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Temp. Mín.: ${previsaoTempo['main']['temp_min']}°C'),
                    SizedBox(width: 10),
                    Text('Temp. Máx.: ${previsaoTempo['main']['temp_max']}°C'),
                  ],
                ),
                Text(
                    'Descrição: ${previsaoTempo['weather'][0]['description']}'),
              ],
            ),
        ],
      ),
    );
  }
}
