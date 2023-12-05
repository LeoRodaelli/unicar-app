class Carro {
  final String modelo;
  final String cor;
  final String placa;

  const Carro({
    required this.modelo,
    required this.cor,
    required this.placa,
  });

  Map<String, dynamic> toJSON() {
    return {
      "modelo": modelo,
      "cor": cor,
      "placa": placa,
    };
  }

  factory Carro.fromJson(Map<String, dynamic> json) {
    return Carro(
      modelo: json["modelo"],
      cor: json["cor"],
      placa: json["placa"],
    );
  }
}
