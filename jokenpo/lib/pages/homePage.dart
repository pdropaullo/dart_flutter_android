import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = Image.network("https://jokenpo-lime.vercel.app/tesoura.png");
  var _mensagem = "";
  var _userWin = 0;
  var _computerWin = 0;
  var _empate = 0;

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    //Exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp =
              Image.network("https://jokenpo-lime.vercel.app/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp =
              Image.network("https://jokenpo-lime.vercel.app/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp =
              Image.network("https://jokenpo-lime.vercel.app/tesoura.png");
        });
    }

    //Validação do ganhador
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou :)";
        _userWin += 1;
      });
    } else if ((escolhaUsuario == "tesoura" && escolhaApp == "pedra") ||
        (escolhaUsuario == "papel" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "pedra" && escolhaApp == "papel")) {
      setState(() {
        this._mensagem = "Você perdeu :(";
        _computerWin += 1;
      });
    } else {
      setState(() {
        this._mensagem = "Empatamos ;)";
        _empate += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JO - KEN - PO"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text("Sua Jogada",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.network(
                    "https://jokenpo-lime.vercel.app/pedra.png",
                    height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.network(
                    "https://jokenpo-lime.vercel.app/papel.png",
                    height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.network(
                    "https://jokenpo-lime.vercel.app/tesoura.png",
                    height: 100),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text("Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Image.network(
            this._imagemApp.image.toString(),
            width: 200,
            height: 200,
          ),
        ],
      ),
    );
  }
}
