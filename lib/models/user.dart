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
    this.localizacao = '',
  });
}

  User user1 = User(
    id: 1,
    userType: 'admin',
    name: 'João Silva',
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
    cartaConducao: true,
    verificado: false,
    ativo: true,
    notaApp: 4,
    nota: 4.5,
);

 User user2 = User(
    id: 2,
    userType: 'user',
    name: 'Maria Oliveira',
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
    cartaConducao: false,
    verificado: true,
    ativo: true,
    notaApp: 3,
    nota: 4.0,
);

 User user3 = User(
    id: 3,
    userType: 'user',
    name: 'Carlos Pereira',
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
    cartaConducao: true,
    verificado: false,
    ativo: true,
    notaApp: 5,
    nota: 3.5,
);

 User user4 = User(
    id: 4,
    userType: 'admin',
    name: 'Ana Martins',
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
    cartaConducao: true,
    verificado: true,
    ativo: true,
    notaApp: 4,
    nota: 4.2,
);

 User user5 = User(
    id: 5,
    userType: 'user',
    name: 'Pedro Fernandes',
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
    cartaConducao: false,
    verificado: true,
    ativo: true,
    notaApp: 2,
    nota: 3.8,
);


