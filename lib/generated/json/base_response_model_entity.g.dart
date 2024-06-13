import 'package:doodleblue_task/generated/json/base/json_convert_content.dart';
import 'package:doodleblue_task/network/base_response_model_entity.dart';

BaseResponseModelEntity $BaseResponseModelEntityFromJson(
    Map<String, dynamic> json) {
  final BaseResponseModelEntity baseResponseModelEntity = BaseResponseModelEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    baseResponseModelEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    baseResponseModelEntity.message = message;
  }
  final List<dynamic>? result = (json['result'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (result != null) {
    baseResponseModelEntity.result = result;
  }
  return baseResponseModelEntity;
}

Map<String, dynamic> $BaseResponseModelEntityToJson(
    BaseResponseModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['result'] = entity.result;
  return data;
}

extension BaseResponseModelEntityExtension on BaseResponseModelEntity {
  BaseResponseModelEntity copyWith({
    int? status,
    String? message,
    List<dynamic>? result,
  }) {
    return BaseResponseModelEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..result = result ?? this.result;
  }
}