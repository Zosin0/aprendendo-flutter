import 'package:http/http.dart' as http;
import 'dart:convert';
import 'entidade.dart';


class BackEnd {
  Future<int> post(Tarefa tarefa) async {
    Uri request = Uri(
        scheme: "http",
        host: "localhost",
        port: 5000,
        path: "/tarefas",
        queryParameters: {
          "tit_tarefa": tarefa.titulo,
          "dsc_tarefa": tarefa.descricao,
          "sts_tarefa": tarefa.status
        });


    http.Response response = await http.post(request);


    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['insert'];
    } else {
      Future.error("Tarefa não cadastrada!");
      return 0;
    }
  }
}
