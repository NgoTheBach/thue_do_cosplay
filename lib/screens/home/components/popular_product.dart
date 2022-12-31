import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/api/product.dart';
import 'package:thue_do_cosplay/components/product_card.dart';
import 'package:thue_do_cosplay/models/All.dart';
import 'package:thue_do_cosplay/screens/home/components/section_title.dart';
import 'package:thue_do_cosplay/screens/product/product_screen.dart';
import 'package:thue_do_cosplay/size_config.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List<Product> products = [];
    // getProducts(1, 10).then((List<Product> products) {
    //   // products.addAll(product);
    // });

    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Sản phẩm mới",
            press: () {
              Navigator.pushNamed(context, ProductScreen.routeName,
                  arguments: ProductArguments(keyword: ''));
            },
            seeMore: true,
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FutureBuilder<List<Product>?>(
            future: getProducts(1, 10), // async work
            builder:
                (BuildContext context, AsyncSnapshot<List<Product>?> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Text('Loading...');
                default:
                  if (snapshot.hasError) {
                    print('Error: ${snapshot.error}');
                    return Text('Wut.');
                  } else {
                    List<Product>? products = snapshot.data;
                    // return Text('Result: ${snapshot.data}');
                    return Row(
                      children: [
                        ...List.generate(
                          products!.length,
                          (index) {
                            // if (demoProducts[index].isPopular)
                            //   return ProductCard(product: demoProducts[index]);
                            return ProductCard(product: products[index]);
                            return SizedBox
                                .shrink(); // here by default width and height is 0
                          },
                        ),
                        SizedBox(width: getProportionateScreenWidth(20)),
                      ],
                    );
                  }
              }
            },
          ),
        )
      ],
    );
  }
}
