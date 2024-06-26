import 'dart:io';
import 'package:adrenture/data/admin_data.dart';
import 'package:adrenture/models/car.dart';
import 'package:adrenture/models/user.dart';
import 'package:adrenture/models/marcas.dart';
import 'package:adrenture/pages/admin/gerirCarro.dart';
import 'package:adrenture/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

List<Brand> marcas = [
  Brand(id: 1, nomeMarca: 'BMW'),
  Brand(id: 2, nomeMarca: 'Audi'),
  Brand(id: 3, nomeMarca: 'Mercedes-Benz'),
  Brand(id: 4, nomeMarca: 'Toyota'),
  Brand(id: 5, nomeMarca: 'Honda'),
  Brand(id: 6, nomeMarca: 'Ford'),
  Brand(id: 7, nomeMarca: 'Chevrolet'),
  Brand(id: 8, nomeMarca: 'Volkswagen'),
  Brand(id: 9, nomeMarca: 'Hyundai'),
  Brand(id: 10, nomeMarca: 'Nissan'),
  Brand(id: 11, nomeMarca: 'Kia'),
  Brand(id: 12, nomeMarca: 'Peugeot'),
  Brand(id: 13, nomeMarca: 'Fiat'),
  Brand(id: 14, nomeMarca: 'Renault'),
  Brand(id: 15, nomeMarca: 'Mazda'),
  Brand(id: 16, nomeMarca: 'Subaru'),
  Brand(id: 17, nomeMarca: 'Jaguar'),
  Brand(id: 18, nomeMarca: 'Land Rover'),
  Brand(id: 19, nomeMarca: 'Volvo'),
  Brand(id: 20, nomeMarca: 'Lexus'),
  Brand(id: 21, nomeMarca: 'Acura'),
  Brand(id: 22, nomeMarca: 'Infiniti'),
  Brand(id: 23, nomeMarca: 'Mitsubishi'),
  Brand(id: 24, nomeMarca: 'Suzuki'),
  Brand(id: 25, nomeMarca: 'Porsche'),
  Brand(id: 26, nomeMarca: 'Ferrari'),
  Brand(id: 27, nomeMarca: 'Lamborghini'),
  Brand(id: 28, nomeMarca: 'Maserati'),
  Brand(id: 29, nomeMarca: 'Alfa Romeo'),
  Brand(id: 30, nomeMarca: 'Bentley'),
  Brand(id: 31, nomeMarca: 'Rolls-Royce'),
  Brand(id: 32, nomeMarca: 'Aston Martin'),
  Brand(id: 33, nomeMarca: 'Bugatti'),
  Brand(id: 34, nomeMarca: 'Tesla'),
  Brand(id: 35, nomeMarca: 'McLaren'),
  Brand(id: 36, nomeMarca: 'Pagani'),
  Brand(id: 37, nomeMarca: 'Koenigsegg'),
  Brand(id: 38, nomeMarca: 'Genesis'),
  Brand(id: 39, nomeMarca: 'Chrysler'),
  Brand(id: 40, nomeMarca: 'Dodge'),
  Brand(id: 41, nomeMarca: 'Jeep'),
  Brand(id: 42, nomeMarca: 'Ram'),
  Brand(id: 43, nomeMarca: 'Buick'),
  Brand(id: 44, nomeMarca: 'Cadillac'),
  Brand(id: 45, nomeMarca: 'GMC'),
  Brand(id: 46, nomeMarca: 'Lincoln'),
  Brand(id: 47, nomeMarca: 'Mini'),
  Brand(id: 48, nomeMarca: 'Smart'),
  Brand(id: 49, nomeMarca: 'Saab'),
  Brand(id: 50, nomeMarca: 'Skoda'),
  Brand(id: 51, nomeMarca: 'Seat')
];
const List<String> combustiveis = ['Gasolina', 'Diesel', 'Eletrico'];
const List<int> numeroPortas = [2, 3, 4, 5];
const List<int> numeroLugares = [2, 3, 4, 5, 7];
const List<String> categorias = ['A', 'A1', 'B', 'BE'];
const List<String> transmissao = ['Manual', 'Automática'];
const List<int> anos = [
  1980,
  1981,
  1982,
  1983,
  1984,
  1985,
  1986,
  1987,
  1988,
  1989,
  1990,
  1991,
  1992,
  1993,
  1994,
  1995,
  1996,
  1997,
  1998,
  1999,
  2000,
  2001,
  2002,
  2003,
  2004,
  2005,
  2006,
  2007,
  2008,
  2009,
  2010,
  2011,
  2012,
  2013,
  2014,
  2015,
  2016,
  2017,
  2018,
  2019,
  2020,
  2021,
  2022,
  2023,
  2024
];
const List<String> cores = [
  'Preto',
  'Branco',
  'Prata',
  'Vermelho',
  'Azul',
  'Verde',
  'Amarelo',
  'Laranja',
  'Roxo',
  'Castanho'
];
const List<String> seguros = ['Fidelidade', 'Allianz'];
const List<String> politicaCombustivel = ['Cheio', 'Vazio', 'Metade'];

class GerirCar2 extends StatefulWidget {
  final Car car;
  final User user;

  const GerirCar2({Key? key, required this.user, required this.car})
      : super(key: key);

  @override
  _GerirCar2PageState createState() => _GerirCar2PageState();
}

class _GerirCar2PageState extends State<GerirCar2> {
  String? _selectedMarca;
  String? _selectedCombustivel;
  int? _selectedNumeroPortas;
  int? _selectedNumeroLugares;
  String? _selectedCategoria;
  String? _selectedTransmissao;
  int? _selectedAno;
  String? _selectedCor;
  String? _selectedSeguro;
  String? _selectedPoliticaCombustivel;
  bool _ativo = true;

  TextEditingController _controllerVelocidadeMaxima = TextEditingController();
  TextEditingController _controllerMatricula = TextEditingController();
  TextEditingController _controllerTotalQuilometros = TextEditingController();
  TextEditingController _controllerDescricao = TextEditingController();
  TextEditingController _controllerPreco = TextEditingController();
  TextEditingController _controllerModelo = TextEditingController();
  TextEditingController _controllerCilindrada = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedMarca = widget.car.marca;
    _selectedCombustivel = widget.car.combustivel;
    _selectedNumeroPortas = widget.car.numeroPortas;
    _selectedNumeroLugares = widget.car.numeroLugares;
    _selectedCategoria = widget.car.categoria;
    _selectedTransmissao = widget.car.transmissao;
    _selectedAno = widget.car.ano.year;
    _selectedCor = widget.car.cor;
    _selectedSeguro = widget.car.seguro;
    _selectedPoliticaCombustivel = widget.car.politicaCombustivel;
    _controllerVelocidadeMaxima.text = widget.car.velocidadeMax.toString();
    _controllerMatricula.text = widget.car.marca.toString();
    _controllerTotalQuilometros.text = widget.car.totalQuilometros.toString();
    _controllerDescricao.text = widget.car.descricao;
    _controllerPreco.text = widget.car.preco.toString();
    _controllerModelo.text = widget.car.modelo.toString();
    _controllerCilindrada.text = widget.car.cilindrada.toString();
  }

  List<String> _imagens = [];

  void _updateAtivo(bool value) {
    setState(() {
      _ativo = value;
    });
  }

  Future<void> _adicionarImagem() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagens.add(pickedFile.path); // Adicionar caminho da imagem à lista
      });

      // Copiar a imagem para a pasta assets/imagens/carros/
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String destino = path.join(appDir.path, 'assets/imagens/carros/');
      final String novoCaminho =
          path.join(destino, path.basename(pickedFile.path));

      try {
        await Directory(destino).create(recursive: true);
        await File(pickedFile.path).copy(novoCaminho);
      } catch (e) {
        print('Erro ao salvar a imagem: $e');
      }
    }
  }

  void goBack(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => GerirCar(user: User.loggedUser!)),
    );
  }

  void _updateCar() {
    final car = Car(
        id: widget.car.id,
        imagemPrincipal: '',
        dono: widget.car.dono,
        marca: _selectedMarca!,
        modelo: _controllerModelo.text,
        combustivel: _selectedCombustivel!,
        numeroPortas: _selectedNumeroPortas!,
        numeroLugares: _selectedNumeroLugares!,
        categoria: _selectedCategoria!,
        velocidadeMax: int.parse(_controllerVelocidadeMaxima.text),
        transmissao: _selectedTransmissao!,
        cilindrada: int.parse(_controllerCilindrada.text),
        ano: DateTime(_selectedAno!),
        cor: _selectedCor!,
        matricula: _controllerMatricula.text,
        totalQuilometros: int.parse(_controllerTotalQuilometros.text),
        seguro: _selectedSeguro!,
        politicaCombustivel: _selectedPoliticaCombustivel!,
        preco: double.parse(_controllerPreco.text),
        descricao: _controllerDescricao.text,
        ativo: _ativo);

    AdminData.updateCar(car, context).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Carro atualizado com sucesso')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha ao atualizar o utilizador. $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => goBack(context),
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3C9096)),
        ),
        title: const Text('Alterar Carro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Carregue as fotos do carro',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: <Widget>[
                    for (var imagem in _imagens)
                      Image.file(File(imagem), width: 80, height: 80),
                    if (_imagens.length < 4 || _imagens.length % 4 == 0)
                      IconButton(
                        icon: Icon(Icons.add_a_photo, size: 80),
                        onPressed: _adicionarImagem,
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Marca'),
                  value: _selectedMarca,
                  items: marcas.map((marca) {
                    return DropdownMenuItem(
                      value: marca.nomeMarca,
                      child: Text(marca.nomeMarca),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedMarca = value;
                    });
                  },
                ),
                TextFormField(
                  controller: _controllerModelo,
                  decoration: const InputDecoration(labelText: 'Modelo'),
                ),
                TextFormField(
                  controller: _controllerMatricula,
                  decoration: const InputDecoration(labelText: 'Matrícula'),
                ),
                TextFormField(
                  controller: _controllerTotalQuilometros,
                  decoration:
                      const InputDecoration(labelText: 'Total de Quilômetros'),
                ),
                TextFormField(
                  controller: _controllerVelocidadeMaxima,
                  decoration:
                      const InputDecoration(labelText: 'Velocidade Máxima'),
                ),
                TextFormField(
                  controller: _controllerDescricao,
                  decoration: const InputDecoration(labelText: 'Descrição'),
                ),
                TextFormField(
                  controller: _controllerPreco,
                  decoration: const InputDecoration(labelText: 'Preço'),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Combustível'),
                  value: _selectedCombustivel,
                  items: combustiveis.map((combustivel) {
                    return DropdownMenuItem(
                      value: combustivel,
                      child: Text(combustivel),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCombustivel = value;
                    });
                  },
                ),
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(labelText: 'Nº de portas'),
                  value: _selectedNumeroPortas,
                  items: numeroPortas.map((portas) {
                    return DropdownMenuItem(
                      value: portas,
                      child: Text(portas.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedNumeroPortas = value;
                    });
                  },
                ),
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(labelText: 'Nº de lugares'),
                  value: _selectedNumeroLugares,
                  items: numeroLugares.map((lugares) {
                    return DropdownMenuItem(
                      value: lugares,
                      child: Text(lugares.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedNumeroLugares = value;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Categoria'),
                  value: _selectedCategoria,
                  items: categorias.map((categoria) {
                    return DropdownMenuItem(
                      value: categoria,
                      child: Text(categoria),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategoria = value;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Transmissão'),
                  value: _selectedTransmissao,
                  items: transmissao.map((tipo) {
                    return DropdownMenuItem(
                      value: tipo,
                      child: Text(tipo),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedTransmissao = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _controllerCilindrada,
                  decoration: const InputDecoration(labelText: 'Cilindrada'),
                ),
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(labelText: 'Ano'),
                  value: _selectedAno,
                  items: anos.map((ano) {
                    return DropdownMenuItem(
                      value: ano,
                      child: Text(ano.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    _selectedAno = value;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Cor'),
                  value: _selectedCor,
                  items: cores.map((cor) {
                    return DropdownMenuItem(
                      value: cor,
                      child: Text(cor),
                    );
                  }).toList(),
                  onChanged: (value) {
                    _selectedCor = value;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Seguro'),
                  value: _selectedSeguro,
                  items: seguros.map((seguro) {
                    return DropdownMenuItem(
                      value: seguro,
                      child: Text(seguro),
                    );
                  }).toList(),
                  onChanged: (value) {
                    _selectedSeguro = value;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      labelText: 'Política de Combustível'),
                  value: _selectedPoliticaCombustivel,
                  items: politicaCombustivel.map((politica) {
                    return DropdownMenuItem(
                      value: politica,
                      child: Text(politica),
                    );
                  }).toList(),
                  onChanged: (value) {
                    _selectedPoliticaCombustivel = value;
                  },
                ),
                /*SwitchListTile(
                  title: const Text('Notificações'),
                  secondary: const Icon(Icons.notifications_outlined, color: Color(0xFF3C9096)),
                  value: _ativo,
                  onChanged: (value) {
                    _updateAtivo(value);
                  },
                ),*/
                const SizedBox(height: 16),
                Center(
                  child: MyButton(
                    onTap: () => _updateCar(),
                    text: "Atualizar",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
