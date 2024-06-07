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
  int totalMudancas;
  late bool transmissao;
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
    required this.totalMudancas,
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
    this.transmissao = false,
    this.cilindrada = 0,
    this.politicaCombustivel =
        'O Deposito Devera estar com a mesma quantidade de combustivel ao iniciar o aluguer',
    this.disponivel = false,
    this.ativo = true,
    this.imagens = const [],
    this.nota = 0,
  });
}

Car alugarCarro = Car(
  id: 0,
  dono: 0,
  marca: '',
  modelo: '',
  combustivel: '',
  numeroPortas: 0,
  numeroLugares: 0,
  totalMudancas: 0,
  ano: DateTime(0),
  cor: '',
  matricula: '',
  totalQuilometros: 0,
  seguro: '',
  descricao: '',
  preco: 0,
  imagemPrincipal: 'assets/images/car.png',
  categoria: '',
  velocidadeMax: 0,
  transmissao: false,
  cilindrada: 0,
  disponivel: false,
  ativo: true,
  nota: 0,
);


Car carro1 = Car(
  id: 1,
  dono: 1,
  marca: 'Rosroice',
  modelo: '21 e meio',
  combustivel: 'Gasolina',
  numeroPortas: 5,
  numeroLugares: 5,
  totalMudancas: 6,
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
  transmissao: true,
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
  totalMudancas: 7,
  ano: DateTime(2023),
  cor: 'Vermelho',
  matricula: '12-AB-34',
  totalQuilometros: 5000,
  seguro: 'Comprehensive',
  descricao: 'Um carro esportivo incrível com desempenho excepcional.',
  preco: 300000,
  imagemPrincipal: 'assets/images/car.png',
);

Car carro3 = Car(
  id: 3,
  dono: 3,
  marca: 'Toyota',
  modelo: 'Corolla',
  combustivel: 'Gasolina',
  numeroPortas: 4,
  numeroLugares: 5,
  totalMudancas: 6,
  ano: DateTime(2020),
  cor: 'Prata',
  matricula: '98-CD-76',
  totalQuilometros: 20000,
  seguro: 'Third-party',
  descricao: 'Um sedã confiável e econômico, ótimo para uso diário.',
  preco: 25000,
  imagemPrincipal: 'assets/images/car.png',
);

Car carro4 = Car(
  id: 4,
  dono: 4,
  marca: 'Volkswagen',
  modelo: 'Golf GTI',
  combustivel: 'Gasolina',
  numeroPortas: 4,
  numeroLugares: 5,
  totalMudancas: 6,
  ano: DateTime(2019),
  cor: 'Branco',
  matricula: '00-EF-12',
  totalQuilometros: 15000,
  seguro: 'Comprehensive',
  descricao: 'Um hatchback esportivo com excelente dirigibilidade.',
  preco: 35000,
  imagemPrincipal: 'assets/images/car.png',
);

Car carro5 = Car(
  id: 5,
  dono: 5,
  marca: 'Tesla',
  modelo: 'Model S',
  combustivel: 'Eletricidade',
  numeroPortas: 4,
  numeroLugares: 5,
  totalMudancas: 1,
  ano: DateTime(2022),
  cor: 'Azul',
  matricula: '55-GH-33',
  totalQuilometros: 10000,
  seguro: 'Comprehensive',
  descricao:
      'Um sedan elétrico com autonomia excepcional e tecnologia avançada.',
  preco: 80000,
  imagemPrincipal: 'assets/images/car.png',
);

Car carro6 = Car(
  id: 6,
  dono: 6,
  marca: 'BMW',
  modelo: 'X5',
  combustivel: 'Diesel',
  numeroPortas: 5,
  numeroLugares: 5,
  totalMudancas: 7,
  ano: DateTime(2021),
  cor: 'Preto',
  matricula: '78-IJ-90',
  totalQuilometros: 12000,
  seguro: 'Comprehensive',
  descricao: 'Um SUV de luxo com desempenho e conforto excepcionais.',
  preco: 70000,
  imagemPrincipal: 'assets/images/car.png',
);

Car carro7 = Car(
  id: 7,
  dono: 7,
  marca: 'Ford',
  modelo: 'Mustang',
  combustivel: 'Gasolina',
  numeroPortas: 2,
  numeroLugares: 4,
  totalMudancas: 6,
  ano: DateTime(2018),
  cor: 'Amarelo',
  matricula: '11-KL-22',
  totalQuilometros: 18000,
  seguro: 'Third-party',
  descricao: 'Um clássico americano com um poderoso motor V8.',
  preco: 40000,
  imagemPrincipal: 'assets/images/car.png',
);

Car carro8 = Car(
  id: 8,
  dono: 8,
  marca: 'Chevrolet',
  modelo: 'Camaro',
  combustivel: 'Gasolina',
  numeroPortas: 2,
  numeroLugares: 4,
  totalMudancas: 6,
  ano: DateTime(2017),
  cor: 'Vermelho',
  matricula: '22-MN-33',
  totalQuilometros: 20000,
  seguro: 'Comprehensive',
  descricao: 'Um muscle car icônico com um design agressivo.',
  preco: 45000,
  imagemPrincipal: 'assets/images/car.png',
);

Car carro9 = Car(
  id: 9,
  dono: 9,
  marca: 'Mercedes-Benz',
  modelo: 'Classe E',
  combustivel: 'Diesel',
  numeroPortas: 4,
  numeroLugares: 5,
  totalMudancas: 7,
  ano: DateTime(2016),
  cor: 'Prata',
  matricula: '33-OP-44',
  totalQuilometros: 25000,
  seguro: 'Comprehensive',
  descricao: 'Um sedan de luxo com conforto e elegância incomparáveis.',
  preco: 60000,
  imagemPrincipal: 'assets/images/car.png',
);

Car carro10 = Car(
  id: 10,
  dono: 10,
  marca: 'Audi',
  modelo: 'A4',
  combustivel: 'Diesel',
  numeroPortas: 4,
  numeroLugares: 5,
  totalMudancas: 7,
  ano: DateTime(2015),
  cor: 'Preto',
  matricula: '44-QR-55',
  totalQuilometros: 30000,
  seguro: 'Comprehensive',
  descricao: 'Um sedan premium com design elegante e tecnologia avançada.',
  preco: 55000,
  imagemPrincipal: 'assets/images/car.png',
);
