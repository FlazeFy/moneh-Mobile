// Usecase get dictionary type
import 'dart:convert';

class DictionaryTypeModel {
  int id;
  String name;

  DictionaryTypeModel({this.id, this.name});

  factory DictionaryTypeModel.fromJson(Map<String, dynamic> map) {
    return DictionaryTypeModel(
      id: map["id"],
      name: map["dictionaries_name"],
    );
  }
}

List<DictionaryTypeModel> dictionaryTypeModelFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<DictionaryTypeModel>.from(
      data['data'].map((item) => DictionaryTypeModel.fromJson(item)));
}
