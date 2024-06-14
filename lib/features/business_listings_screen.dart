import 'package:doodleblue_task/util/dimensions.dart';
import 'package:doodleblue_task/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../model/response/model_response_business_entity.dart';
import 'business_detail_screen.dart';

class BusinessListingScreen extends StatelessWidget {
  const BusinessListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Businesses',
          style: TextStyle(
            fontSize: Dimensions.sp24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 4.0,
      ),
      body: Container(
        color: Colors.grey[100],
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            final business =
                ModelResponseBusinessEntity.fromJson(BusinessModel);
            return BusinessCard(business: business);
          },
        ),
      ),
    );
  }
}

class BusinessCard extends StatelessWidget {
  final ModelResponseBusinessEntity business;

  const BusinessCard({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BusinessDetailScreen(business: business),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(
            vertical: Dimensions.h10, horizontal: Dimensions.w16),
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.r15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(Dimensions.r15)),
                    child: Container(
                      height: Dimensions.h200,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(Dimensions.r15)),
                  child: Image.network(
                    business.imageUrl ?? '',
                    height: Dimensions.h200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: Dimensions.h200,
                                color: Colors.grey[300],
                              ),
                            );
                    },
                  ),
                ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: Dimensions.h4, horizontal: Dimensions.w8),
                    decoration: BoxDecoration(
                      color:
                          business.isClosed ?? true ? Colors.red : Colors.green,
                      borderRadius: BorderRadius.circular(Dimensions.r4),
                    ),
                    child: Text(
                      business.isClosed ?? true ? 'Closed' : 'Open',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.h16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    business.name ?? '',
                    style: TextStyle(
                      fontSize: Dimensions.sp22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: Dimensions.h8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber[700]),
                      SizedBox(width: Dimensions.w4),
                      Text(
                        '${business.rating} stars, ${business.reviewCount} reviews',
                        style: TextStyle(
                          fontSize: Dimensions.sp16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.h8),
                  if (business.categories!.isNotNullOrEmpty())
                    Wrap(
                      spacing: Dimensions.w8,
                      children: business.categories!
                          .map((category) => Chip(
                                label: Text(category.title ?? 'N/A'),
                                backgroundColor: Colors.teal[100],
                              ))
                          .toList(),
                    ),
                  SizedBox(height: Dimensions.h8),
                  Text(
                    '${((business.distance ?? 0.00) / 1609.34).toStringAsFixed(2)} miles away',
                    style: TextStyle(
                      fontSize: Dimensions.sp16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final Map<String, dynamic> BusinessModel = {
  "id": "16ZnHpuaaBt92XWeJHCC5A",
  "alias": "olio-e-più-new-york-7",
  "name": "Olio e Più",
  "image_url":
      "https://s3-media4.fl.yelpcdn.com/bphoto/CUpPgz_Q4QBHxxxxDJJTTA/o.jpg",
  "is_closed": false,
  "url":
      "https://www.yelp.com/biz/olio-e-pi%C3%B9-new-york-7?adjust_creative=BlndLX7A8uetp91dgJCDcw&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=BlndLX7A8uetp91dgJCDcw",
  "review_count": 5571,
  "categories": [
    {"alias": "pizza", "title": "Pizza"},
    {"alias": "italian", "title": "Italian"},
    {"alias": "cocktailbars", "title": "Cocktail Bars"}
  ],
  "rating": 4.5,
  "coordinates": {
    "latitude": 40.73406231935954,
    "longitude": -73.99999980859876
  },
  "transactions": ["delivery", "pickup"],
  "price": "599",
  "location": {
    "address1": "3 Greenwich Ave",
    "address2": null,
    "address3": "",
    "city": "New York",
    "zip_code": "10014",
    "country": "US",
    "state": "NY",
    "display_address": ["3 Greenwich Ave", "New York, NY 10014"]
  },
  "phone": "+12122436546",
  "display_phone": "(212) 243-6546",
  "distance": 3207.585573981827
};
