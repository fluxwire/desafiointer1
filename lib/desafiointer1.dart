import 'dart:io';

import 'package:desafiointer1/models/yaml_model.dart';

int calculate() {
  return 6 * 7;
}

Future<List<YAMLModel>> openFile() async {
  final file = await File(
          'C:\\Users\\Laila\\Projetos\\Masterclass\\Intermediario\\desafiointer1\\lib\\assets\\pubspec_masterclass.yaml')
      .readAsLines();

  final List<YAMLModel> yamlList = [];

  for (var i = 0; i < file.length; i++) {
    final item = file[i];

    final stringTrim = item.trimLeft();

    //é comentário
    if (!stringTrim.startsWith('#') && stringTrim.isNotEmpty) {
      final doisPontosIndex = item.indexOf(':');

      //apenas um alor para a chave
      if (doisPontosIndex != -1) {
        final name = item.substring(0, doisPontosIndex);
        final value = item.substring(doisPontosIndex + 1).trim();
        final numberOfSpaces = (name.length - name.trimLeft().length);

        if (name.trim() == 'path') {
          var i = 1;
        }

        YAMLModel novalinha = YAMLModel(
            name: name.trim(),
            value: value,
            numberOfSpaces: numberOfSpaces,
            filho: null);

        if (numberOfSpaces != 0) {
          identificaPai(newItem: novalinha, list: yamlList);
        } else {
          yamlList.add(novalinha);
        }
      } else {}
    }
  }
  return yamlList;
}

bool identificaPai(
    {required YAMLModel newItem, required List<YAMLModel> list}) {
  //começa a ler a lista de traz para frente
  bool adicionou = true;
  for (var i = list.length - 1; i >= 0; i--) {
    var item = list[i];
    //procura o nó que tem identação imediatamente menor
    while (adicionou) {
      //SE O NUMERO DE ESPAÇOES - 2 É MAIOR DO QUE DO QUE A IDENTAÇAO ATUAL
      //ENTRA NO FILHO DELE
      if (newItem.numberOfSpaces - 2 > item.numberOfSpaces) {
        adicionou = identificaPai(newItem: newItem, list: item.filho!);
        return true;
      } else {
        if (item.filho == null) {
          item.filho = [];
          item.filho!.add(newItem);
          adicionou = false;
          return true;
        } else {
          item.filho!.add(newItem);
          adicionou = false;
          return true;
        }
      }
    }
  }

  //se não encontrar retorna string fazia
  return false;
}

/*
String identificaPai(
    {required int numberOfSpaces, required List<YAMLModel> list}) {
  //começa a ler a lista de traz para frente
  for (var i = list.length - 1; i >= 0; i--) {
    var item = list[i];
    //procura o nó que tem identação imediatamente menor
    if (item.numberOfSpaces == numberOfSpaces - 2) {
      //quando encontrar retorna o nome do mesmo como pai
      return item.name;
    }
  }
  return '';
}
*/

// void serachPackages(List<YAMLModel> listYaml) {
//   var isRunning = true;
//   while (isRunning) {
//     print('menu => \n * pack\n * imprimir\n');
//     var input = stdin.readLineSync();
//     print("\x1B[2J\x1B[0;0H");
//     if (input == 'pack') {
//       print("\x1B[2J\x1B[0;0H");
//       print('<<< PESQUISA POR PACOTE >>>');
//       print('Pesquise: ');
//       final query = stdin.readLineSync();

//       final result = listYaml.where((element) => element.name == query);

//       if (result.isNotEmpty) {
//         final pack = result.first;
//         if (pack.father != null) {
//           print('${pack.father}:');
//         }
//         print('  ${pack.name}: ${pack.value}');
//       } else {
//         print('$query não encontrado.');
//       }
//       print('PRECIONE QUALQUER TECLA');
//       final espera = stdin.readLineSync();
//       print("\x1B[2J\x1B[0;0H");
//     } else if (input == 'listar') {
//       print('IMPRIMIR TODO O YAML');
//       // printYaml(listYaml);
//     } else {
//       isRunning = false;
//     }
//   }
//   print("\x1B[2J\x1B[0;0H");
//   print('ENCERRADO');
// }
