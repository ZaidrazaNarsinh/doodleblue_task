import 'package:doodleblue_task/features/cubits/business_list_cubit.dart';
import 'package:doodleblue_task/features/repositories/business_listing_repository.dart';
import 'package:doodleblue_task/model/response/model_response_business_list_entity.dart';
import 'package:doodleblue_task/util/dimensions.dart';
import 'package:doodleblue_task/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../model/response/model_response_business_entity.dart';
import '../network/api_result.dart';
import 'business_detail_screen.dart';

class BusinessListingScreen extends StatefulWidget {
  const BusinessListingScreen({super.key});

  @override
  State<BusinessListingScreen> createState() => _BusinessListingScreenState();
}

class _BusinessListingScreenState extends State<BusinessListingScreen> {
  late BusinessListCubit businessListCubit =
      BusinessListCubit(BusinessListingRepository());
  @override
  void initState() {
    businessListCubit.callGetBusinessListAPI();
    super.initState();
  }

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
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.teal),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 4.0,
      ),
      body: BlocProvider.value(
        value: businessListCubit,
        child: BlocBuilder<BusinessListCubit,
                APIResultState<ModelResponseBusinessListEntity>?>(
            bloc: businessListCubit,
            builder: (context, state) {
              if (state != null) {
                if (APIResult.isFailure(state)) {
                  return SizedBox(
                    height: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(state.message ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.red, fontSize: Dimensions.sp16)),
                      ),
                    ),
                  );
                } else if (APIResult.isSuccess(state)) {
                  if (state.result != null) {
                    final businessList = state.result!.businesses;
                    return Container(
                      color: Colors.grey[100],
                      child: ListView.builder(
                        itemCount: businessList?.length,
                        itemBuilder: (context, index) {
                          return BusinessCard(business: businessList![index]);
                        },
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: double.infinity,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("No businesses found",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.sp16)),
                        ),
                      ),
                    );
                  }
                }
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              );
            }),
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