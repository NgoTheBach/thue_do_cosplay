import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    //required this.cart,
  }) : super(key: key);

  //final InvoiceDetails cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                    "url Image") //Image.network(cart.product_img.split('|')[0]),
                ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "product name",
                //cart.product_name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "rental_cost",
                  //"${numberWithDot(cart.invd_product_rental_price.toString())}đ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                  children: [
                    TextSpan(
                      text:
                          "product quatity", //" x${cart.invd_product_quantity}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    TextSpan(
                      text: " total rental fee * quatity",
                      //" = ${numberWithDot((cart.invd_product_quantity * cart.invd_product_rental_price).toString())}đ",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
