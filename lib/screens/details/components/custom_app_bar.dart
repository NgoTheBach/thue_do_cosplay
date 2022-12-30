import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thue_do_cosplay/constants.dart';

import '../../../size_config.dart';

class CustomAppBar extends StatelessWidget {
  final double rating;

  CustomAppBar({required this.rating});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  primary: kPrimaryColor,
                  backgroundColor: Color.fromARGB(125, 0, 0, 0),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  "assets/icons/Back ICon.svg",
                  height: 15,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
            // Hiện số xếp hạng trên ảnh
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(14),
            //   ),
            //   child: Row(
            //     children: [
            //       Text(
            //         "$rating",
            //         style: const TextStyle(
            //           fontSize: 14,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //       const SizedBox(width: 5),
            //       SvgPicture.asset("assets/icons/Star Icon.svg"),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}