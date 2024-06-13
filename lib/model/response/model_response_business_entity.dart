import 'package:doodleblue_task/generated/json/base/json_field.dart';
import 'package:doodleblue_task/generated/json/model_response_business_entity.g.dart';
import 'dart:convert';
export 'package:doodleblue_task/generated/json/model_response_business_entity.g.dart';

@JsonSerializable()
class ModelResponseBusinessEntity {
	String? id = '';
	String? alias = '';
	String? name = '';
	@JSONField(name: "image_url")
	String? imageUrl = '';
	@JSONField(name: "is_closed")
	bool? isClosed = false;
	String? url = '';
	@JSONField(name: "review_count")
	int? reviewCount = 0;
	List<ModelResponseBusinessCategories>? categories = [];
	double? rating;
	ModelResponseBusinessCoordinates? coordinates;
	List<String>? transactions = [];
	String? price = '';
	ModelResponseBusinessLocation? location;
	String? phone = '';
	@JSONField(name: "display_phone")
	String? displayPhone = '';
	double? distance;
	ModelResponseBusinessEntity();

	factory ModelResponseBusinessEntity.fromJson(Map<String, dynamic> json) => $ModelResponseBusinessEntityFromJson(json);

	Map<String, dynamic> toJson() => $ModelResponseBusinessEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ModelResponseBusinessCategories {
	String? alias = '';
	String? title = '';

	ModelResponseBusinessCategories();

	factory ModelResponseBusinessCategories.fromJson(Map<String, dynamic> json) => $ModelResponseBusinessCategoriesFromJson(json);

	Map<String, dynamic> toJson() => $ModelResponseBusinessCategoriesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ModelResponseBusinessCoordinates {
	double? latitude;
	double? longitude;

	ModelResponseBusinessCoordinates();

	factory ModelResponseBusinessCoordinates.fromJson(Map<String, dynamic> json) => $ModelResponseBusinessCoordinatesFromJson(json);

	Map<String, dynamic> toJson() => $ModelResponseBusinessCoordinatesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ModelResponseBusinessLocation {
	String? address1 = '';
	dynamic address2;
	String? address3 = '';
	String? city = '';
	@JSONField(name: "zip_code")
	String? zipCode = '';
	String? country = '';
	String? state = '';
	@JSONField(name: "display_address")
	List<String>? displayAddress = [];

	ModelResponseBusinessLocation();

	factory ModelResponseBusinessLocation.fromJson(Map<String, dynamic> json) => $ModelResponseBusinessLocationFromJson(json);

	Map<String, dynamic> toJson() => $ModelResponseBusinessLocationToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}