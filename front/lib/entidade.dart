class Tarefa {
  final String titulo;
  final String descricao;
  final String status;


  Tarefa(
    this.titulo,
    this.descricao,
    this.status,
  );


  @override
  String toString() {
    return 'Produto{nome: $titulo, quantidade: $descricao, valor: $status}';
  }
}
