import 'package:doodleblue_task/generated/json/base/json_convert_content.dart';
import 'package:doodleblue_task/model/response/model_response_business_entity.dart';

ModelResponseBusinessEntity $ModelResponseBusinessEntityFromJson(
    Map<String, dynamic> json) {
  final ModelResponseBusinessEntity modelResponseBusinessEntity = ModelResponseBusinessEntity();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    modelResponseBusinessEntity.id = id;
  }
  final String? alias = jsonConvert.convert<String>(json['alias']);
  if (alias != null) {
    modelResponseBusinessEntity.alias = alias;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    modelResponseBusinessEntity.name = name;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['image_url']);
  if (imageUrl != null) {
    modelResponseBusinessEntity.imageUrl = imageUrl;
  }
  final bool? isClosed = jsonConvert.convert<bool>(json['is_closed']);
  if (isClosed != null) {
    modelResponseBusinessEntity.isClosed = isClosed;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    modelResponseBusinessEntity.url = url;
  }
  final int? reviewCount = jsonConvert.convert<int>(json['review_count']);
  if (reviewCount != null) {
    modelResponseBusinessEntity.reviewCount = reviewCount;
  }
  final List<
      ModelResponseBusinessCategories>? categories = (json['categories'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<ModelResponseBusinessCategories>(
          e) as ModelResponseBusinessCategories).toList();
  if (categories != null) {
    modelResponseBusinessEntity.categories = categories;
  }
  final double? rating = jsonConvert.convert<double>(json['rating']);
  if (rating != null) {
    modelResponseBusinessEntity.rating = rating;
  }
  final ModelResponseBusinessCoordinates? coordinates = jsonConvert.convert<
      ModelResponseBusinessCoordinates>(json['coordinates']);
  if (coordinates != null) {
    modelResponseBusinessEntity.coordinates = coordinates;
  }
  final List<String>? transactions = (json['transactions'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (transactions != null) {
    modelResponseBusinessEntity.transactions = transactions;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    modelResponseBusinessEntity.price = price;
  }
  final ModelResponseBusinessLocation? location = jsonConvert.convert<
      ModelResponseBusinessLocation>(json['location']);
  if (location != null) {
    modelResponseBusinessEntity.location = location;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    modelResponseBusinessEntity.phone = phone;
  }
  final String? displayPhone = jsonConvert.convert<String>(
      json['display_phone']);
  if (displayPhone != null) {
    modelResponseBusinessEntity.displayPhone = displayPhone;
  }
  final double? distance = jsonConvert.convert<double>(json['distance']);
  if (distance != null) {
    modelResponseBusinessEntity.distance = distance;
  }
  return modelResponseBusinessEntity;
}

Map<String, dynamic> $ModelResponseBusinessEntityToJson(
    ModelResponseBusinessEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['alias'] = entity.alias;
  data['name'] = entity.name;
  data['image_url'] = entity.imageUrl;
  data['is_closed'] = entity.isClosed;
  data['url'] = entity.url;
  data['review_count'] = entity.reviewCount;
  data['categories'] = entity.categories?.map((v) => v.toJson()).toList();
  data['rating'] = entity.rating;
  data['coordinates'] = entity.coordinates?.toJson();
  data['transactions'] = entity.transactions;
  data['price'] = entity.price;
  data['location'] = entity.location?.toJson();
  data['phone'] = entity.phone;
  data['display_phone'] = entity.displayPhone;
  data['distance'] = entity.distance;
  return data;
}

extension ModelResponseBusinessEntityExtension on ModelResponseBusinessEntity {
  ModelResponseBusinessEntity copyWith({
    String? id,
    String? alias,
    String? name,
    String? imageUrl,
    bool? isClosed,
    String? url,
    int? reviewCount,
    List<ModelResponseBusinessCategories>? categories,
    double? rating,
    ModelResponseBusinessCoordinates? coordinates,
    List<String>? transactions,
    String? price,
    ModelResponseBusinessLocation? location,
    String? phone,
    String? displayPhone,
    double? distance,
  }) {
    return ModelResponseBusinessEntity()
      ..id = id ?? this.id
      ..alias = alias ?? this.alias
      ..name = name ?? this.name
      ..imageUrl = imageUrl ?? this.imageUrl
      ..isClosed = isClosed ?? this.isClosed
      ..url = url ?? this.url
      ..reviewCount = reviewCount ?? this.reviewCount
      ..categories = categories ?? this.categories
      ..rating = rating ?? this.rating
      ..coordinates = coordinates ?? this.coordinates
      ..transactions = transactions ?? this.transactions
      ..price = price ?? this.price
      ..location = location ?? this.location
      ..phone = phone ?? this.phone
      ..displayPhone = displayPhone ?? this.displayPhone
      ..distance = distance ?? this.distance;
  }
}

ModelResponseBusinessCategories $ModelResponseBusinessCategoriesFromJson(
    Map<String, dynamic> json) {
  final ModelResponseBusinessCategories modelResponseBusinessCategories = ModelResponseBusinessCategories();
  final String? alias = jsonConvert.convert<String>(json['alias']);
  if (alias != null) {
    modelResponseBusinessCategories.alias = alias;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    modelResponseBusinessCategories.title = title;
  }
  return modelResponseBusinessCategories;
}

Map<String, dynamic> $ModelResponseBusinessCategoriesToJson(
    ModelResponseBusinessCategories entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['alias'] = entity.alias;
  data['title'] = entity.title;
  return data;
}

extension ModelResponseBusinessCategoriesExtension on ModelResponseBusinessCategories {
  ModelResponseBusinessCategories copyWith({
    String? alias,
    String? title,
  }) {
    return ModelResponseBusinessCategories()
      ..alias = alias ?? this.alias
      ..title = title ?? this.title;
  }
}

ModelResponseBusinessCoordinates $ModelResponseBusinessCoordinatesFromJson(
    Map<String, dynamic> json) {
  final ModelResponseBusinessCoordinates modelResponseBusinessCoordinates = ModelResponseBusinessCoordinates();
  final double? latitude = jsonConvert.convert<double>(json['latitude']);
  if (latitude != null) {
    modelResponseBusinessCoordinates.latitude = latitude;
  }
  final double? longitude = jsonConvert.convert<double>(json['longitude']);
  if (longitude != null) {
    modelResponseBusinessCoordinates.longitude = longitude;
  }
  return modelResponseBusinessCoordinates;
}

Map<String, dynamic> $ModelResponseBusinessCoordinatesToJson(
    ModelResponseBusinessCoordinates entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['latitude'] = entity.latitude;
  data['longitude'] = entity.longitude;
  return data;
}

extension ModelResponseBusinessCoordinatesExtension on ModelResponseBusinessCoordinates {
  ModelResponseBusinessCoordinates copyWith({
    double? latitude,
    double? longitude,
  }) {
    return ModelResponseBusinessCoordinates()
      ..latitude = latitude ?? this.latitude
      ..longitude = longitude ?? this.longitude;
  }
}

ModelResponseBusinessLocation $ModelResponseBusinessLocationFromJson(
    Map<String, dynamic> json) {
  final ModelResponseBusinessLocation modelResponseBusinessLocation = ModelResponseBusinessLocation();
  final String? address1 = jsonConvert.convert<String>(json['address1']);
  if (address1 != null) {
    modelResponseBusinessLocation.address1 = address1;
  }
  final dynamic address2 = json['address2'];
  if (address2 != null) {
    modelResponseBusinessLocation.address2 = address2;
  }
  final String? address3 = jsonConvert.convert<String>(json['address3']);
  if (address3 != null) {
    modelResponseBusinessLocation.address3 = address3;
  }
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    modelResponseBusinessLocation.city = city;
  }
  final String? zipCode = jsonConvert.convert<String>(json['zip_code']);
  if (zipCode != null) {
    modelResponseBusinessLocation.zipCode = zipCode;
  }
  final String? country = jsonConvert.convert<String>(json['country']);
  if (country != null) {
    modelResponseBusinessLocation.country = country;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    modelResponseBusinessLocation.state = state;
  }
  final List<String>? displayAddress = (json['display_address'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (displayAddress != null) {
    modelResponseBusinessLocation.displayAddress = displayAddress;
  }
  return modelResponseBusinessLocation;
}

Map<String, dynamic> $ModelResponseBusinessLocationToJson(
    ModelResponseBusinessLocation entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['address1'] = entity.address1;
  data['address2'] = entity.address2;
  data['address3'] = entity.address3;
  data['city'] = entity.city;
  data['zip_code'] = entity.zipCode;
  data['country'] = entity.country;
  data['state'] = entity.state;
  data['display_address'] = entity.displayAddress;
  return data;
}

extension ModelResponseBusinessLocationExtension on ModelResponseBusinessLocation {
  ModelResponseBusinessLocation copyWith({
    String? address1,
    dynamic address2,
    String? address3,
    String? city,
    String? zipCode,
    String? country,
    String? state,
    List<String>? displayAddress,
  }) {
    return ModelResponseBusinessLocation()
      ..address1 = address1 ?? this.address1
      ..address2 = address2 ?? this.address2
      ..address3 = address3 ?? this.address3
      ..city = city ?? this.city
      ..zipCode = zipCode ?? this.zipCode
      ..country = country ?? this.country
      ..state = state ?? this.state
      ..displayAddress = displayAddress ?? this.displayAddress;
  }
}