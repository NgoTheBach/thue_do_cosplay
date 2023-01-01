import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/models/All.dart';

// import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: Stack(
        children: <Widget>[
          Container(
            // First child (child 1)
            child: Body(product: agrs.product),
            width: double.infinity,
            color: Color(0xFFF5F6F9),
            // margin: EdgeInsets.all(20),
          ),
          Container(
            // Second child (child 2)
            child: CustomAppBar(rating: 5),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
