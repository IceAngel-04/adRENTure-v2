class User {
  static User? loggedUser;

  int userID;
  String userType;
  String userImage;
  String? username;
  String nomeUtilizador;
  String email;
  int? telefone;
  String? password;
  String novoEmail;
  int nif;
  DateTime datanascimento;
  int cartaConducao;
  String? morada;
  String? moradaAntiga;
  bool notificacoes;
  DateTime dataAdesao;
  bool verificado;
  String? localizacao;
  DateTime dataUltimaAtualizacao;
  int notaApp;
  bool ativo;
  double nota;
  String? newPassword;
  String? newPasswordConfirm;
  String? lastPassword;

  User({
    required this.userID,
    this.userType = "utilizador",
    required this.nomeUtilizador,
    required this.email,
    this.password,
    required this.nif,
    required this.datanascimento,
    this.newPassword,
    this.newPasswordConfirm,
    this.notificacoes = true,
    required this.cartaConducao,
    this.verificado = false,
    this.ativo = true,
    this.notaApp = 0,
    this.userImage = 'assets/images/user.png',
    this.nota = 0.0,
    this.username,
    this.telefone,
    this.morada,
    this.moradaAntiga,
    this.lastPassword,
    this.localizacao,
    this.novoEmail = '',
    DateTime? dataAdesao,
    DateTime? dataUltimaAtualizacao,
  })  : this.dataAdesao = dataAdesao ?? DateTime.now(),
        this.dataUltimaAtualizacao = dataUltimaAtualizacao ?? DateTime.now();

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'],
      userType: json['userType'],
      nomeUtilizador: json['nomeUtilizador'],
      email: json['email'],
      cartaConducao: int.parse(json['cartaConducao'].toString()),
      nif: int.parse(json['nif'].toString()),
      datanascimento: DateTime.parse(json['dataNascimento']), // Ensure this matches JSON key
      userImage: json['imagemPerfil'] ?? 'assets/images/user.png',
      // Handle other fields similarly
    );
  }

  factory User.currentUser({
    required int userID,
    required String userType,
    required String nomeUtilizador,
    required String email,
    required int cartaConducao,
    required int nif,
    required DateTime datanascimento,
  }) {
    return User(
      userID: userID,
      userType: userType,
      nomeUtilizador: nomeUtilizador,
      email: email,
      cartaConducao: cartaConducao,
      nif: nif,
      password: '',
      datanascimento: datanascimento,
    );
  }

  factory User.forLogin({
    required String email,
    required String password,
  }) {
    return User(
      userID: 0,
      email: email,
      password: password,
      nomeUtilizador: '', // Provide default or empty values
      nif: 0,
      cartaConducao: 0,
      datanascimento: DateTime(1900)
    );
  }

  factory User.forUpdateEmail({
    required int userID,
    required String novoEmail,
  }) {
    return User(
      userID: userID,
      email: '',
      novoEmail: novoEmail,
      password: '',
      nomeUtilizador: '', // Provide default or empty values
      nif: 0,
      cartaConducao: 0,
      datanascimento: DateTime(1900),
    );
  }

  factory User.forUpdateNumber({
    required int userID,
    required int telefone,
  }) {
    return User(
      userID: userID,
      email: '',
      novoEmail: '',
      password: '',
      nomeUtilizador: '', // Provide default or empty values
      nif: 0,
      cartaConducao: 0,
      datanascimento: DateTime(1900),
      telefone: telefone,
    );
  }

  factory User.forUpdateAddress({
    required int userID,
    required String morada,
  }) {
    return User(
      userID: userID,
      email: '',
      novoEmail: '',
      password: '',
      nomeUtilizador: '', // Provide default or empty values
      nif: 0,
      cartaConducao: 0,
      datanascimento: DateTime(1900),
      morada: morada,
    );
  }

  factory User.forUpdatePassword({
    required int userID,
    required String password,
    required String newPassword,
    required String newPasswordConfirm,
  }) {
    return User(
      userID: userID,
      email: '',
      novoEmail: '',
      password: password,
      nomeUtilizador: '', // Provide default or empty values
      nif: 0,
      cartaConducao: 0,
      datanascimento: DateTime(1900),
      newPassword: newPassword,
      newPasswordConfirm: newPasswordConfirm,
    );
  }

  factory User.forResetPassword({
    required String email,
    required String password,
    required String lastPassword,
  }) {
    return User(
      userID: 0,
      email: email,
      password: password,
      lastPassword: lastPassword,
      nomeUtilizador: '', // Provide default or empty values
      nif: 0,
      cartaConducao: 0,
      datanascimento: DateTime(1900),
    );
  }

  factory User.forRegister({
    required String email,
    required String password,
    required int nif,
    required String nomeUtilizador,
    required int cartaConducao,
    required DateTime datanascimento,
  }) {
    return User(
      userID: 0,
      email: email,
      password: password,
      nomeUtilizador: nomeUtilizador, // Provide default or empty values
      nif: nif,
      cartaConducao: cartaConducao,
      datanascimento: datanascimento,
    );
  }

  factory User.forUpdateNotifications({
    required int userID,
    required bool notifications,
  }) {
    return User(
      userID: userID,
      email: '',
      password: '',
      nomeUtilizador: '', // Forneça valores padrão ou vazios
      nif: 0,
      cartaConducao: 0,
      datanascimento: DateTime(1900),
      notificacoes: notifications,
    );
  }
}
