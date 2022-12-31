import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/models/All.dart';
import 'package:thue_do_cosplay/screens/details/detail_screen.dart';
// import 'package:shop_app/models/Product.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(
                // product: product
                ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  //padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    // color: kSecondaryColor.withOpacity(0.1),
                    image: DecorationImage(
                      image: NetworkImage(""
                          //product.product_img.split('|')[0]
                          ),
                      fit: BoxFit.cover,
                      // alignment: Alignment.center,
                    ),
                  ),
                  child: Hero(
                    tag: 1, //product.product_id,
                    // child: Image.network(product.product_img.split('|')[0]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(10)),
                          color: Colors.grey.withOpacity(0.1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(""
                                //product.product_img.split('|')[0]
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                //product.product_name,
                "product name",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "product rental price",
                    //"${numberWithDot(product.product_rental_price.toString())}đ",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  // InkWell(
                  //   borderRadius: BorderRadius.circular(50),
                  //   onTap: () {},
                  //   child: Container(
                  //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                  //     height: getProportionateScreenWidth(28),
                  //     width: getProportionateScreenWidth(28),
                  //     decoration: BoxDecoration(
                  //       color: //product.isFavourite
                  //           true
                  //               ? kPrimaryColor.withOpacity(0.15)
                  //               : kSecondaryColor.withOpacity(0.1),
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: SvgPicture.asset(
                  //       "assets/icons/Heart Icon_2.svg",
                  //       color: //product.isFavourite
                  //           true ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                  //     ),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
