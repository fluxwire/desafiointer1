// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      name: value,
      if (filho != null) 'filho': filho!.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  YAMLModel copyWith({
    String? name,
    dynamic? value,
    int? numberOfSpaces,
    List<YAMLModel>? filho,
  }) {
    return YAMLModel(
      name: name ?? this.name,
      value: value ?? this.value,
      numberOfSpaces: numberOfSpaces ?? this.numberOfSpaces,
      filho: filho ?? this.filho,
    );
  }
}
