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

      final name = item.substring(0, doisPontosIndex);
      final value = item.substring(doisPontosIndex + 1).trim();
      final numberOfSpaces = (name.length - name.trimLeft().length);

      final father = numberOfSpaces == 0
          ? null
          : identificaPai(numberOfSpaces: numberOfSpaces, list: yamlList);

      YAMLModel novalinha = YAMLModel(
        name: name.trim(),
        value: value,
        father: father,
        numberOfSpaces: numberOfSpaces,
      );

      yamlList.add(novalinha);
    }
  }
  return yamlList;
}

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

  //se não encontrar retorna string fazia
  return '';
}
