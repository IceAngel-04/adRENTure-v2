class Payment {
  int id; 
  int locador;
  int locatario;
  int aluguerID; 
  double valorInicial;
  double valorTaxa; 
  double valorExtra; 
  double valorFinal; 
  DateTime data; 
  String metodoPagamento; 
  double desconto; 
  String estadoPagamento; 

  // Constructor for the Payment class
  Payment({
    required this.id,
    required this.locador,
    required this.locatario,
    required this.aluguerID,
    required this.valorInicial,
    required this.valorTaxa,
    required this.valorExtra,
    required this.valorFinal,
    DateTime? data,
    required this.metodoPagamento,
    required this.desconto,
    required this.estadoPagamento,
  }) : data = data ?? DateTime.now();
}
