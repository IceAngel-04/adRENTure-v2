class User {
  int id;
  String userType;
  late String
      userImage; // Alterado para String para representar o caminho da imagem
  String? username;
  String nomeUtilizador;
  String email;
  int? telefone;
  String password;
  int nif;
  DateTime
      datanascimento; // Alterado para DateTime para representar uma data de nascimento
  int? cartaConducao;
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


  factory User.forLogin({
    required String email,
    required String password,
  }) {
    return User(
      id: 0,
      email: email,
      password: password,
      nomeUtilizador: '', // Provide default or empty values
      nif: 0,
      cartaConducao: 0,
      datanascimento: DateTime(1900)
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
      id: 0,
      email: email,
      password: password,
      nomeUtilizador: nomeUtilizador, // Provide default or empty values
      nif: nif,
      cartaConducao: cartaConducao,
      datanascimento: datanascimento
      );
  }

  User({
    required this.id,
    this.userType = "utilizador",
    required this.nomeUtilizador,
    required this.email,
    required this.password,
    required this.nif,
    required this.datanascimento,
    this.notificacoes = true,
    required this.cartaConducao,
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
    this.localizacao = '',
  });
}

  User user1 = User(
    id: 1,
    userType: 'admin',
    nomeUtilizador: 'João Silva',
    email: 'joao.silva@example.com',
    password: 'senha123',
    nif: 123456789,
    datanascimento: DateTime(1990, 1, 15),
    username: 'joaosilva',
    telefone: 912345678,
    morada: 'Rua das Flores, 123',
    moradaAntiga: 'Rua das Pedras, 45',
    lastPassword: 'senhaAnterior',
    localizacao: 'Braga centro',
    userImage: 'assets/images/user.png',
    notificacoes: true,
    cartaConducao: 123456726,
    verificado: false,
    ativo: true,
    notaApp: 4,
    nota: 4.5,
);

 User user2 = User(
    id: 2,
    userType: 'user',
    nomeUtilizador: 'Maria Oliveira',
    email: 'maria.oliveira@example.com',
    password: 'senha456',
    nif: 987654321,
    datanascimento: DateTime(1985, 5, 20),
    username: 'mariaoliveira',
    telefone: 923456789,
    morada: 'Avenida Principal, 456',
    moradaAntiga: 'Rua Secundária, 12',
    lastPassword: 'senhaAnterior2',
    localizacao: 'Porto centro',
    userImage: 'assets/images/user.png',
    notificacoes: false,
    cartaConducao: 213425221,
    verificado: true,
    ativo: true,
    notaApp: 3,
    nota: 4.0,
);

 User user3 = User(
    id: 3,
    userType: 'user',
    nomeUtilizador: 'Carlos Pereira',
    email: 'carlos.pereira@example.com',
    password: 'senha789',
    nif: 192837465,
    datanascimento: DateTime(2000, 8, 30),
    username: 'carlospereira',
    telefone: 934567890,
    morada: 'Praça das Águas, 789',
    moradaAntiga: 'Rua das Fontes, 34',
    lastPassword: 'senhaAnterior3',
    localizacao: 'Lisboa centro',
    userImage: 'assets/images/user.png',
    notificacoes: true,
    cartaConducao: 212478312,
    verificado: false,
    ativo: true,
    notaApp: 5,
    nota: 3.5,
);

 User user4 = User(
    id: 4,
    userType: 'admin',
    nomeUtilizador: 'Ana Martins',
    email: 'ana.martins@example.com',
    password: 'senha321',
    nif: 564738291,
    datanascimento: DateTime(1995, 2, 14),
    username: 'anamartins',
    telefone: 945678901,
    morada: 'Largo do Mercado, 321',
    moradaAntiga: 'Rua do Comércio, 56',
    lastPassword: 'senhaAnterior4',
    localizacao: 'Coimbra centro',
    userImage: 'assets/images/user.png',
    notificacoes: true,
    cartaConducao: 734512531,
    verificado: true,
    ativo: true,
    notaApp: 4,
    nota: 4.2,
);

 User user5 = User(
    id: 5,
    userType: 'user',
    nomeUtilizador: 'Pedro Fernandes',
    email: 'pedro.fernandes@example.com',
    password: 'senha654',
    nif: 817263545,
    datanascimento: DateTime(1998, 11, 11),
    username: 'pedrofernandes',
    telefone: 956789012,
    morada: 'Rua do Sol, 654',
    moradaAntiga: 'Avenida da Lua, 98',
    lastPassword: 'senhaAnterior5',
    localizacao: 'Faro centro',
    userImage: 'assets/images/user.png',
    notificacoes: false,
    cartaConducao: 128357225,
    verificado: true,
    ativo: true,
    notaApp: 2,
    nota: 3.8,
);


