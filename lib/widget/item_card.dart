import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:internship_2/model/page_data.dart';
import 'package:shimmer/shimmer.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({required this.paageData, Key? key}) : super(key: key);
  final PageData paageData;
  @override
  Widget build(BuildContext context) {
    double boxHeight = (MediaQuery.of(context).size.height * 1 / 2) - 40;

    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return SizedBox(
            height: boxHeight,
            child: Card(
              margin: const EdgeInsets.all(10),
              elevation: 1,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              height: 250,
                              imageUrl: paageData.products![index].productUrl
                                  .toString(),
                              placeholderFadeInDuration:
                                  const Duration(seconds: 2),
                              placeholder: (context, url) => Shimmer.fromColors(
                                  child: Container(
                                    height: 250,
                                  ),
                                  baseColor:
                                      const Color.fromARGB(255, 239, 239, 239),
                                  highlightColor:
                                      const Color.fromARGB(255, 202, 202, 202)),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, right: 20),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: RatingBar.builder(
                            initialRating: 3,
                            itemSize: 25,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              debugPrint(rating.toString());
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  //name of the product
                  Text(
                    paageData.products![index].productName.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //multiline product description
                  Center(
                    child: Text(
                      paageData.products![index].productDescription.toString(),
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
