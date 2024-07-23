// ignore_for_file: unnecessary_null_comparison, unnecessary_cast


import '../../../DBModel/EnqTypeModel.dart';
// import '../../../DBModel/EnqTypeModel.dart';

class SalesTypeModal {
  List<SalesTypeData>? itemdata;
  String message;
  bool? status;
  String? exception;
  int? stcode;
  SalesTypeModal(
      {required this.itemdata,
      required this.message,
      required this.status,
      this.exception,
      required this.stcode});
  factory SalesTypeModal.fromJson(List<dynamic> jsons, int stcode) {
    if (jsons != null && jsons.isNotEmpty) {
      var list = jsons as List;
      List<SalesTypeData> dataList =
          list.map((data) => SalesTypeData.fromJson(data)).toList();
      return SalesTypeModal(
          itemdata: dataList,
          message: "sucess",
          status: true,
          stcode: stcode,
          exception: null);
    } else {
      return SalesTypeModal(
          itemdata: null,
          message: "failed",
          status: false,
          stcode: stcode,
          exception: null);
    }
  }

 factory SalesTypeModal.issues(Map<String,dynamic> jsons, int stcode) {
    return SalesTypeModal(
        itemdata: null,
        message: jsons['respCode'],
        status: null,
        stcode: stcode,
        exception: jsons['respDesc']);
  }

  factory SalesTypeModal.error(String jsons, int stcode) {
    return SalesTypeModal(
        itemdata: null,
        message: 'Exception',
        status: null,
        stcode: stcode,
        exception: jsons);
  }
}

class SalesTypeData {
  SalesTypeData({
    required this.Code,
    required this.Name,
  });

  String? Code;
  String? Name;

  factory SalesTypeData.fromJson(Map<String, dynamic> json) =>
      SalesTypeData(
        Code: json['code'] ?? 00,
        Name: json['description'] ?? '',
      );

  Map<String, Object?> toMap() => {
        OrderTypeDBModel.code: Code,
        OrderTypeDBModel.name: Name,
      };
}
