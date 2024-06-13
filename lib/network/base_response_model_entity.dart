
import 'dart:convert';

import 'package:doodleblue_task/generated/json/base_response_model_entity.g.dart';

import '../generated/json/base/json_field.dart';

@JsonSerializable()
class BaseResponseModelEntity {
  int? status;
  String? message;
  List<dynamic>? result;

  BaseResponseModelEntity();

  factory BaseResponseModelEntity.fromJson(Map<String, dynamic> json) =>
      $BaseResponseModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $BaseResponseModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
