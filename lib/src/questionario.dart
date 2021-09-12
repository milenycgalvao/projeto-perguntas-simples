import 'package:flutter/material.dart';
import 'package:projeto_perguntas/src/questao.dart';
import 'package:projeto_perguntas/src/resposta.dart';

class Questionario extends StatelessWidget {
  final void Function() responder;
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;

  Questionario(
      {required this.perguntas, //ele vai exigir que seja passado para poder chamar
      required this.perguntaSelecionada,
      required this.responder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((text) => Resposta(text, responder)).toList(),
      ],
    );
  }
}
