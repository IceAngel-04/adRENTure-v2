class User {
  int id;
  String userType;
  late String
      userImage; // Alterado para String para representar o caminho da imagem
  String? username;
  String name;
  String email;
  int? telefone;
  String password;
  int nif;
  DateTime
      datanascimento; // Alterado para DateTime para representar uma data de nascimento
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
  double nota = 0;

  User({
    required this.id,
    required this.userType,
    required this.name,
    required this.email,
    required this.password,
    required this.nif,
    required this.datanascimento,
    this.notificacoes = true,
    this.cartaConducao = true,
    this.verificado = false,
    this.ativo = true,
    this.notaApp = 0,
    this.userImage = 'assets/images/user.png',
    this.nota = 0,
    this.username = '',
    this.telefone = 0,
    this.morada = '',
    this.moradaAntiga = '',
    this.lastPassword = '',
    this.localizacao = 'Braga centro',
  });
}

