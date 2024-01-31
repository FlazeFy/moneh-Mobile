import 'dart:convert';

// Usecase get all pocket
class QueriesGetAllPocket {
  String id;
  String pocketName;
  String pocketDesc;
  String pocketType;
  int pocketLimit;

  QueriesGetAllPocket(
      {this.id,
      this.pocketName,
      this.pocketDesc,
      this.pocketType,
      this.pocketLimit});

  factory QueriesGetAllPocket.fromJson(Map<String, dynamic> map) {
    return QueriesGetAllPocket(
      id: map["id"],
      pocketName: map["pockets_name"],
      pocketDesc: map["pockets_desc"],
      pocketType: map["pockets_type"],
      pocketLimit: map["pockets_limit"],
    );
  }
}

List<QueriesGetAllPocket> queriesGetAllPocketFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesGetAllPocket>.from(
      data['data']['data'].map((item) => QueriesGetAllPocket.fromJson(item)));
}
