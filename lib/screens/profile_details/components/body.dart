import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/constants.dart';
import 'package:thue_do_cosplay/screens/profile_details/components/profile_details_form.dart';
import 'package:thue_do_cosplay/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Cập nhật thông tin", style: headingStyle),
                // Text(
                //   "Complete your details or continue \nwith social media",
                //   textAlign: TextAlign.center,
                // ),
                // SizedBox(height: SizeConfig.screenHeight * 0.08),
                //chỗ này phải coi sửa cái file dưới body nha
                ProfileDetailsForm(),
                SizedBox(height: getProportionateScreenHeight(20)),
                // Text(
                //   'By continuing your confirm that you agree \nwith our Term and Condition',
                //   textAlign: TextAlign.center,
                //   style: Theme.of(context).textTheme.caption,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
