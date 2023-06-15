import 'package:flutter/material.dart';
import 'entidade.dart';
import 'servico.dart';


void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de Tarefa'),
        ),
        body: const Cadastro(),
      ),
    );
  }
}


enum StatusTarefa { baixa, media, alta }


class Cadastro extends StatefulWidget {
  const Cadastro({super.key});


  @override
  State<Cadastro> createState() => _CadastroState();
}


class _CadastroState extends State<Cadastro> {
  final TextEditingController _controladorTitulo = TextEditingController();
  final TextEditingController _controladorDescricao = TextEditingController();
  StatusTarefa? _character = StatusTarefa.baixa;


  void cadastrar() {
    final String titulo = _controladorTitulo.text;
    final String descricao = _controladorDescricao.text;
    final String status = (_character == StatusTarefa.baixa
        ? "B"
        : (_character == StatusTarefa.media ? "B" : "A"));
    final Tarefa tarefa = Tarefa(titulo, descricao, status);
    BackEnd backEnd = BackEnd();
    //Future<int> retorno = backEnd.post(tarefa);


    backEnd.post(tarefa).then((response) {
      _showDialog(
          "A tarefa foi cadastrada com sucesso.\n\nIdentificador: $response");
    }).catchError((onError) {
      _showDialog("Não foi possível cadastrar a tarefa!");
    });


    // Limpando campos
    _controladorTitulo.text = "";
    _controladorDescricao.text = "";
    setState(() {
      _character = StatusTarefa.baixa;
    });
  }


  Future<void> _showDialog(String msg) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Cadastro de Tarefa"),
          content: Text(msg),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _controladorTitulo,
            decoration: const InputDecoration(labelText: 'Título'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: TextField(
              minLines: 4,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: _controladorDescricao,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: <Widget>[
                const Text("Prioridade da Tarefa"),
                ListTile(
                  title: const Text('Baixa'),
                  leading: Radio<StatusTarefa>(
                    value: StatusTarefa.baixa,
                    groupValue: _character,
                    onChanged: (StatusTarefa? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Média'),
                  leading: Radio<StatusTarefa>(
                    value: StatusTarefa.media,
                    groupValue: _character,
                    onChanged: (StatusTarefa? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Alta'),
                  leading: Radio<StatusTarefa>(
                    value: StatusTarefa.alta,
                    groupValue: _character,
                    onChanged: (StatusTarefa? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              onPressed: cadastrar,
              child: const Text('Cadastrar Tarefa'),
            ),
          ),
        ],
      ),
    );
  }
}
