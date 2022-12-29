import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/screens/home/components/discount_banner.dart';
import 'package:thue_do_cosplay/screens/home/components/home_header.dart';
import 'package:thue_do_cosplay/screens/home/components/popular_product.dart';
import 'package:thue_do_cosplay/screens/home/components/special_offers.dart';

import '../../../size_config.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            // Categories(),
            // Danh mục / Loại sản phẩm
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
