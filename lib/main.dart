import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/src/questao.dart';
import 'package:projeto_perguntas/src/resposta.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    //print(_perguntaSelecionada);
    print('respondida!');
  }

  final perguntas = ['Como é o seu nome?', 'Qual é a sua cor favorita?'];
  @override
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Preto', 'vermelho', 'verde', 'branco'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['coelho', 'cobra', 'elefante', 'leão', 'abelha'],
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'respostas': ['maria', 'joão', 'leo', 'pedro'],
      },
    ];

    List<Widget> respostas = [];

    /*ESSA PARTE FAZ A MESMA COISA QUE O FOR ABAIXO DESSE
    String textoResp;
    for (int i = 0;
        i < perguntas[_perguntaSelecionada].cast()['respostas'].length;
        i++) {
      //print(i);
      //print(perguntas[_perguntaSelecionada].cast()['respostas'][i]);
      textoResp = perguntas[_perguntaSelecionada].cast()['respostas'][i];
      respostas.add(Resposta(textoResp, _responder));
    }*/

    for (String textoResp
        in perguntas[_perguntaSelecionada].cast()['respostas']) {
      //print(textoResp);
      respostas.add(Resposta(textoResp, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            /*Resposta('Resposta 1', _responder),
            Resposta('Resposta 2', _responder),
            Resposta('Resposta 3', _responder),*/
            ...respostas,
          ],
        ),
      ),
    );
  }
}
