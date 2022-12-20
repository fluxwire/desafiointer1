// ignore_for_file: public_member_api_docs, sort_constructors_first
class YAMLModel {
  final String name;
  final dynamic value;
  final int numberOfSpaces;
  List<YAMLModel>? filho;

  YAMLModel({
    required this.name,
    required this.value,
    required this.numberOfSpaces,
    required this.filho,
  });
}
