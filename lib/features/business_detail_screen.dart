import 'package:doodleblue_task/util/dimensions.dart';
import 'package:doodleblue_task/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shimmer/shimmer.dart';
import '../model/response/model_response_business_entity.dart';

class BusinessDetailScreen extends StatelessWidget {
  final ModelResponseBusinessEntity business;

  const BusinessDetailScreen({super.key, required this.business});

  void launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchMaps() async {
    if (await MapLauncher.isMapAvailable(MapType.google) == true &&
        business.coordinates?.latitude != null &&
        business.coordinates?.longitude != null) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(
            business.coordinates!.latitude!, business.coordinates!.longitude!),
        title: "${business.name}",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          business.name ?? 'Business Details',
          style: TextStyle(
            fontSize: Dimensions.sp24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.teal),
        backgroundColor: Colors.teal,
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: Dimensions.h250,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                Image.network(
                  business.imageUrl ?? '',
                  height: Dimensions.h250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: Dimensions.h250,
                              width: double.infinity,
                              color: Colors.grey[300],
                            ),
                          );
                  },
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
                    business.name ?? 'N/A',
                    style: TextStyle(
                      fontSize: Dimensions.sp28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: Dimensions.h8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber[700]),
                          SizedBox(width: Dimensions.w4),
                          Text(
                            '${business.rating ?? 'N/A'} stars',
                            style: TextStyle(
                              fontSize: Dimensions.sp18,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${business.reviewCount ?? 0} reviews',
                        style: TextStyle(
                          fontSize: Dimensions.sp16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.h8),

                  if (business.price != null)
                    Text(
                      'Price: ${business.price}',
                      style: TextStyle(
                        fontSize: Dimensions.sp16,
                        color: Colors.grey[600],
                      ),
                    ),
                  SizedBox(height: Dimensions.h8),

                  if (business.categories != null &&
                      business.categories!.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categories:',
                          style: TextStyle(
                            fontSize: Dimensions.sp16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: Dimensions.h4),
                        if (business.categories.isNotNullOrEmpty())
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
                      ],
                    ),

                  CommonListTileCard(
                    icon: Icons.location_on,
                    iconColor: Colors.red,
                    text:
                        business.location?.displayAddress?.join(', ') ?? 'N/A',
                    onTap: launchMaps,
                  ),

                  CommonListTileCard(
                    icon: Icons.phone,
                    iconColor: Colors.blue,
                    text: business.displayPhone ?? 'N/A',
                    onTap: () {
                      launchUrl(Uri.parse('tel:${business.phone ?? ''}'));
                    },
                  ),
                  // Distance
                  if (business.distance != null)
                    CommonListTileCard(
                      icon: Icons.map,
                      iconColor: Colors.green,
                      text:
                          '${(business.distance! / 1609.34).toStringAsFixed(2)} miles away',
                      onTap: launchMaps,
                    ),
                  SizedBox(height: Dimensions.h16),

                  // Transactions
                  if (business.transactions.isNotNullOrEmpty())
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Transactions:',
                          style: TextStyle(
                            fontSize: Dimensions.sp16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: Dimensions.h4),
                        if (business.transactions.isNotNullOrEmpty())
                          Wrap(
                            spacing: Dimensions.w8,
                            children: business.transactions!
                                .map((transaction) => Chip(
                                      label: Text(transaction),
                                      backgroundColor: Colors.green[100],
                                    ))
                                .toList(),
                          ),
                        SizedBox(height: Dimensions.w16),
                      ],
                    ),

                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        launchURL(business.url ?? '');
                      },
                      icon: const Icon(Icons.web, color: Colors.white),
                      label: const Text('Visit Business Website'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.w32,
                            vertical: Dimensions.h16),
                        textStyle: TextStyle(
                          fontSize: Dimensions.sp18,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimensions.r12),
                        ),
                        elevation: 5.0,
                      ),
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

class CommonListTileCard extends StatelessWidget {
  const CommonListTileCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.text,
    this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: Dimensions.h8),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: Icon(icon, color: iconColor),
          title: Text(
            text,
            style: TextStyle(
              fontSize: Dimensions.sp16,
              color: Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
