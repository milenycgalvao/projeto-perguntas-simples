import 'package:flutter/material.dart';
import 'package:projeto_perguntas/src/questao.dart';
import 'package:projeto_perguntas/src/resposta.dart';

class Questionario extends StatelessWidget {
  final void Function() _responder;
  final List<String> respostas;
  final List<Map<String, Object>> _perguntas; //
  final int _perguntaSelecionada;

  Questionario(this._perguntas, this._perguntaSelecionada, this.respostas,
      this._responder);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
        ...respostas.map((text) => Resposta(text, _responder)).toList(),
      ],
    );
  }
}
