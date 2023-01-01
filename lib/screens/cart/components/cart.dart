import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/constants.dart';
import 'package:thue_do_cosplay/models/All.dart';
import 'package:thue_do_cosplay/size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

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
              child: Image.network(cart.productUrlImage.split('|')[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.productName,
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
                  text: "${numberWithDot(cart.productRentalPrice.toString())}đ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                  children: [
                    TextSpan(
                      text: " ${cart.cartProductQuantity}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    TextSpan(
                      text:
                          " = ${numberWithDot((cart.cartProductQuantity * cart.productRentalPrice).toString())}đ",
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
