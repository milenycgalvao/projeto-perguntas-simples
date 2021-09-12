import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/src/questionario.dart';
import 'package:projeto_perguntas/src/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
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

  void _responder() {
    if (temPerguntaSelecionada) {
      //nem precisava desse if
      setState(() {
        _perguntaSelecionada++;
      });
    }
    print('respondida!');
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  final perguntas = ['Como é o seu nome?', 'Qual é a sua cor favorita?'];
  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                _perguntas, _perguntaSelecionada, respostas, _responder)
            : Resultado(),
      ),
    );
  }
}
