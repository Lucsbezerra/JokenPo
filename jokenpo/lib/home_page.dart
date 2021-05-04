import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opação abaixo";

  void _opcaoSelecionada(String escolhaUsuaria) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
        //validando ganhador

        if ((escolhaUsuaria == "pedra" && escolhaApp == "tesoura") ||
            (escolhaUsuaria == "tesoura" && escolhaApp == "papel") ||
            (escolhaUsuaria == "papel" && escolhaApp == "pedra")) {
          setState(() {
            this._mensagem = "Parabens você ganhou!";
          });
        } else((escolhaUsuaria == "tesoura" && escolhaApp == "pedra") ||
            escolhaUsuaria == "papel" && escolhaApp == "tesoura" ||
            escolhaUsuaria == "pedra" && escolhaApp == "papel") {
          setState(() {
            this._mensagem = "Parabens você perdeu!";
          });
        } else {
          this._mensagem = "Empatamos!";
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //text
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do app",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //image
          Image(image: this._imagemApp),
          //text
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //Row image image image
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset(
                    "imagens/pedra.png",
                    height: 100,
                  )),

              //papel
              GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset(
                    "imagens/papel.png",
                    height: 100,
                  )),

              //tesoura
              GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset(
                    "imagens/tesoura.png",
                    height: 100,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
