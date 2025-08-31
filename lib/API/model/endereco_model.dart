class EnderecoModel {
  String cep;
  String? logradouro;
  String? bairro;
  String? localidade;
  String? estado;

  EnderecoModel({
    required this.cep,
    this.logradouro,
    this.bairro,
    this.localidade,
    this.estado,
  });

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      estado: map['estado'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'cep': cep};
  }
  
}
