class Car {
  int id;
  int dono;
  String marca;
  String modelo;
  String combustivel;
  int numeroPortas;
  int numeroLugares;
  late String categoria;
  late int velocidadeMax;
  String transmissao;
  late int cilindrada;
  DateTime ano;
  String cor;
  String matricula;
  int totalQuilometros;
  String seguro;
  late String politicaCombustivel;
  String descricao;
  double preco;
  late bool disponivel;
  late bool ativo;
  String imagemPrincipal;
  late List<String> imagens;

  double nota = 0;

  Car({
    required this.id,
    required this.dono,
    required this.marca,
    required this.modelo,
    required this.combustivel,
    required this.numeroPortas,
    required this.numeroLugares,
    required this.ano,
    required this.cor,
    required this.matricula,
    required this.totalQuilometros,
    required this.seguro,
    required this.descricao,
    required this.preco,
    required this.imagemPrincipal,
    this.categoria = '',
    this.velocidadeMax = 0,
    this.transmissao = '',
    this.cilindrada = 0,
    this.politicaCombustivel =
        'O Deposito Devera estar com a mesma quantidade de combustivel ao iniciar o aluguer',
    this.disponivel = false,
    this.ativo = true,
    this.imagens = const [],
    this.nota = 0,
  });

  
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['carroID'] is int ? json['carroID'] : int.parse(json['carroID']),
      dono: json['locador'] is int ? json['locador'] : int.parse(json['locador']),
      marca: json['marca'],
      modelo: json['modelo'],
      combustivel: json['combustivel'],
      numeroPortas: json['nPortas'] is int ? json['nPortas'] : int.parse(json['nPortas']),
      numeroLugares: json['nLugares'] is int ? json['nLugares'] : int.parse(json['nLugares']),
      categoria: json['categoria'] ?? '',
      velocidadeMax: json['velocidadeMax'] is int ? json['velocidadeMax'] : int.parse(json['velocidadeMax'] ?? '0'),
      totalQuilometros: json['totalKilometros'] is int ? json['totalKilometros'] : int.parse(json['totalKilometros'] ?? '0'),
      transmissao: json['transmissao'] ?? '',
      cilindrada: json['cilindrada'] is int ? json['cilindrada'] : int.parse(json['cilindrada'] ?? '0'),
      ano: json['ano'] is DateTime ? json['ano'] : DateTime.parse(json['ano'] ?? '0'),
      cor: json['cor'] ?? '',
      matricula: json['matricula'] ?? '',
      seguro: json['seguro'] ?? '',
      politicaCombustivel: json['politicaCombustivel'] ?? '',
      preco: json['preco'] is String ? double.parse(json['preco']) : json['preco'].toDouble(),
      disponivel: json['disponivel'] == 1,
      ativo: json['ativo'] == 1,
      descricao: json['descricao'] ?? '',
      imagemPrincipal: json['imagemPrincipal'] ?? 'assets/images/car.png',
    );
  }

  factory Car.forRent({
    required String marca,
    required String modelo,
    required String combustivel,
    required int numeroPortas,
    required int numeroLugares,
    required String categoria,
    required int velocidadeMax,
    required String transmissao,
    required int cilindrada,
    required DateTime ano,
    required String cor,
    required String matricula,
    required int totalQuilometros,
    required String seguro,
    required String politicaCombustivel,
    required double preco,
    required String descricao,
    required int dono,
  }) {
    return Car(
      id: 0,
      dono: dono,
      descricao: descricao,
      imagemPrincipal: '',
      marca: marca,
      modelo: modelo,
      combustivel: combustivel,
      numeroPortas: numeroPortas,
      numeroLugares: numeroLugares,
      categoria: categoria,
      velocidadeMax: velocidadeMax,
      transmissao: transmissao,
      cilindrada: cilindrada,
      ano: DateTime(2023),
      cor: cor,
      matricula: matricula,
      totalQuilometros: totalQuilometros,
      seguro: seguro,
      politicaCombustivel: politicaCombustivel,
      preco: preco,
    );
  }

}

Car alugarCarro = Car(
  id: 0,
  dono: 0,
  marca: '',
  modelo: '',
  combustivel: '',
  numeroPortas: 0,
  numeroLugares: 0,
  ano: DateTime(2020),
  cor: '',
  matricula: '',
  totalQuilometros: 0,
  seguro: '',
  descricao: '',
  preco: 0,
  imagemPrincipal: 'assets/images/car.png',
  categoria: '',
  velocidadeMax: 0,
  transmissao: '',
  cilindrada: 0,
  disponivel: false,
  ativo: true,
  nota: 0,
);


Car carro1 = Car(
  id: 1,
  dono: 1,
  marca: 'Ford',
  modelo: 'Fiesta',
  combustivel: 'Gasolina',
  numeroPortas: 5,
  numeroLugares: 5,
  ano: DateTime(1850),
  cor: 'Roxo',
  matricula: '99-PP-99',
  totalQuilometros: 10000,
  seguro: 'felididade',
  descricao: 'Carro muito bonito e com poucos quilometros',
  preco: 100,
  imagemPrincipal: 'assets/images/car.png',
  categoria: 'classico',
  velocidadeMax: 300,
  transmissao: 'Automatico',
  cilindrada: 37,
  disponivel: true,
  ativo: true,
  nota: 4.9,
  imagens: ['assets/images/car.png', 'assets/images/car.png', 'assets/images/car.png', 'assets/images/car.png', 'assets/images/car.png', 'assets/images/car.png', 'assets/images/car.png']
);

Car carro2 = Car(
  id: 2,
  dono: 2,
  marca: 'Ferrarci',
  modelo: 'Ferrari F8 Tributo',
  combustivel: 'Gasolina',
  numeroPortas: 2,
  numeroLugares: 2,
  ano: DateTime(1950),
  cor: 'Vermelho',
  matricula: '12-AB-34',
  totalQuilometros: 5000,
  seguro: 'Comprehensive',
  descricao: 'Um carro esportivo incrível com desempenho excepcional.',
  preco: 300000,
  imagemPrincipal: 'assets/images/car.png',
);

// ahahahaha