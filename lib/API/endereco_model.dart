class EnderecoModel {
  String cep;
  String? logradouro;
  String? unidade;
  String? bairro;
  String? localidade;
  String? uf;
  String? estado;
  String? regiao;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  EnderecoModel({
    required this.cep,
    this.logradouro,
    this.unidade,
    this.bairro,
    this.localidade,
    this.uf,
    this.estado,
    this.regiao,
  });

  //PARA RECEBER OS DADOS
  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      unidade: map['unidade'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
      estado: map['estado'] ?? '',
      regiao: map['regiao'] ?? '',
    );
  }

  // PARA ENVIAR OS DADOS
  Map<String, dynamic> toMap() {
    return {'cep': cep};
  }
}
