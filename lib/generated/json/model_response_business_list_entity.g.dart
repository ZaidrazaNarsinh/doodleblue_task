import 'package:doodleblue_task/generated/json/base/json_convert_content.dart';
import 'package:doodleblue_task/model/response/model_response_business_list_entity.dart';
import 'package:doodleblue_task/model/response/model_response_business_entity.dart';


ModelResponseBusinessListEntity $ModelResponseBusinessListEntityFromJson(
    Map<String, dynamic> json) {
  final ModelResponseBusinessListEntity modelResponseBusinessListEntity = ModelResponseBusinessListEntity();
  final List<
      ModelResponseBusinessEntity>? businesses = (json['businesses'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<ModelResponseBusinessEntity>(
          e) as ModelResponseBusinessEntity).toList();
  if (businesses != null) {
    modelResponseBusinessListEntity.businesses = businesses;
  }
  return modelResponseBusinessListEntity;
}

Map<String, dynamic> $ModelResponseBusinessListEntityToJson(
    ModelResponseBusinessListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['businesses'] = entity.businesses?.map((v) => v.toJson()).toList();
  return data;
}

extension ModelResponseBusinessListEntityExtension on ModelResponseBusinessListEntity {
  ModelResponseBusinessListEntity copyWith({
    List<ModelResponseBusinessEntity>? businesses,
  }) {
    return ModelResponseBusinessListEntity()
      ..businesses = businesses ?? this.businesses;
  }
}