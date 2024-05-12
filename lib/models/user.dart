class User {
  int id;
  String userType;
  late String userImage; // Alterado para String para representar o caminho da imagem
  String? username;
  String name;
  String email;
  int? telefone;
  String password;
  int nif;
  DateTime datanascimento; // Alterado para DateTime para representar uma data de nascimento
  bool cartaConducao = true;
  String? morada;
  String? moradaAntiga;
  String? lastPassword;
  bool notificacoes = true;
  DateTime dataAdesao = DateTime.now();
  bool verificado = false;
  String?
      localizacao; // Alterado para String para representar a localização GPS
  DateTime dataUltimaAtualizacao = DateTime.now();
  int notaApp = 0;
  bool ativo = true;

  User({
    required this.id,
    required this.userType,
    required this.name,
    required this.email,
    required this.password,
    required this.nif,
    required this.datanascimento,
  }) {
    // Definindo os valores padrão
    notificacoes = true;
    cartaConducao = true;
    verificado = false;
    ativo = true;
    notaApp = 0;
    userImage = 'lib/assets/images/user.png';
  }
}
