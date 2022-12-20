import 'package:desafiointer1/desafiointer1.dart';
import 'package:desafiointer1/models/yaml_model.dart';

void main(List<String> arguments) async {
  // print('Hello world: ${desafiointer1.calculate()}!');

  var listYaml = await openFile();

  List<Map<String, dynamic>> map =
      List<YAMLModel>.from(listYaml).map((e) => e.toMap()).toList();

  // serachPackages(listYaml);
}
