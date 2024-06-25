class Rent {
  int id;
  int carroID;
  int locatario;
  double custoTotalCarro;
  int totalQuilometrosInicio;
  int totalQuilometrosFim;
  String status;
  int nota;
  bool ativo;

  Rent({
    required this.id,
    required this.carroID,
    required this.locatario,
    required this.custoTotalCarro,
    required this.totalQuilometrosInicio,
    required this.totalQuilometrosFim,
    required this.status,
    required this.nota,
    required this.ativo
  });
}
