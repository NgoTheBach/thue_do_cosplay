import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/screens/home/components/icon_btn_with_counter.dart';
import 'package:thue_do_cosplay/screens/home/components/search_field.dart';
import '../../../size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => null
           // press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            // numOfitem: 3,
            press: () => null
           // press: () => Navigator.pushNamed(context, InvoiceScreen.routeName),
          ),
        ],
      ),
    );
  }
}
