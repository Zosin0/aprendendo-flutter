class Exercicio {
  final String nome;
  final String desc;
  final String numrep;
  final String numgasto;

  Exercicio(
    this.nome,
    this.desc,
    this.numrep,
    this.numgasto
  );


  @override
  String toString() {
    return 'Produto{nome: $nome, desc: $desc, num-rep: $numrep, num-gasto $numgasto}';
  }
}
