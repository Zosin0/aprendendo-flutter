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
          title: const Text('Cadastro de Exercicio'),
        ),
        body: const Cadastro(),
      ),
    );
  }
}



class Cadastro extends StatefulWidget {
  const Cadastro({super.key});


  @override
  State<Cadastro> createState() => _CadastroState();
}


class _CadastroState extends State<Cadastro> {
  final TextEditingController _controladorTitulo = TextEditingController();
  final TextEditingController _controladorDescricao = TextEditingController();
  final TextEditingController _controladorNumrep = TextEditingController();
  final TextEditingController _controladorNumgasto = TextEditingController();


  void cadastrar() {
    final String nome = _controladorTitulo.text;
    final String desc = _controladorDescricao.text;
    final String numrep = _controladorNumrep.text;
    final String numgasto = _controladorNumgasto.text;

    final Exercicio exercicio = Exercicio(nome, desc, numrep, numgasto);
    BackEnd backEnd = BackEnd();
    //Future<int> retorno = backEnd.post(tarefa);


    backEnd.post(exercicio).then((response) {
      _showDialog(
          "O Exercicio foi cadastrado com sucesso.\n\nIdentificador: $response");
    }).catchError((onError) {
      _showDialog("Não foi possível cadastrar o exercicio!");
    });


    // Limpando campos
    _controladorTitulo.text = "";
    _controladorDescricao.text = "";
    _controladorNumrep.text = "";
    _controladorNumgasto.text = "";
    

  }


  Future<void> _showDialog(String msg) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Cadastro de Exercicio"),
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _controladorNumrep,
                  decoration: const InputDecoration(labelText: 'Numero de Repetições'),
              ),
            ],
          ),
          ),                
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _controladorNumgasto,
                  decoration: const InputDecoration(labelText: 'Numero de gasto calórico'),
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
