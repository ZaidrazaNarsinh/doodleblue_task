import 'package:doodleblue_task/generated/json/base/json_field.dart';
import 'package:doodleblue_task/generated/json/model_response_business_list_entity.g.dart';
import 'dart:convert';

import 'package:doodleblue_task/model/response/model_response_business_entity.dart';
export 'package:doodleblue_task/generated/json/model_response_business_list_entity.g.dart';

@JsonSerializable()
class ModelResponseBusinessListEntity {
	List<ModelResponseBusinessEntity>? businesses = [];

	ModelResponseBusinessListEntity();

	factory ModelResponseBusinessListEntity.fromJson(Map<String, dynamic> json) => $ModelResponseBusinessListEntityFromJson(json);

	Map<String, dynamic> toJson() => $ModelResponseBusinessListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}