import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/constants.dart';
import 'package:thue_do_cosplay/screens/product/product_screen.dart';
import 'package:thue_do_cosplay/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          if (value.length >= 3) {
            Navigator.pushNamed(context, ProductScreen.routeName,
                arguments: ProductArguments(keyword: value));
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Tìm kiếm...",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
