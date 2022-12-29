// import 'package:flutter/material.dart';


// import '../../../constants.dart';
// import '../../../size_config.dart';

// class ProfileDetailsForm extends StatefulWidget {
//   String? fullname;
//   String? email;
//   String? phoneNumber;
//   String? address;
//   String? bankAccountNumber;
//   String? bankName;

//   TextEditingController fullnameText = TextEditingController();
//   TextEditingController emailText = TextEditingController();
//   TextEditingController passwordText = TextEditingController();
//   TextEditingController phoneNumberText = TextEditingController();
//   TextEditingController addressText = TextEditingController();
//   TextEditingController bankAccountNumberText = TextEditingController();
//   TextEditingController bankNameText = TextEditingController();

//   @override
//   _ProfileDetailsFormState createState() => _ProfileDetailsFormState();
// }

// class _ProfileDetailsFormState extends State<ProfileDetailsForm> {
//   final _formKey = GlobalKey<FormState>();
//   final List<String?> errors = [];
//   //User? user;

//   void addError({String? error}) {
//     if (!errors.contains(error))
//       setState(() {
//         errors.add(error);
//       });
//   }

//   void removeError({String? error}) {
//     if (errors.contains(error))
//       setState(() {
//         errors.remove(error);
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<User?>(
//         future: getUser(BaseSharedPreferences.getString('user_id')),
//         builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.waiting:
//               return Text('Loading...');
//             default:
//               if (snapshot.hasError) {
//                 print('Error: ${snapshot.error}');
//                 return Text('Wut.');
//               } else {
//                 user = snapshot.data;
//                 // print(user?.user_phone_number);
//                 return SafeArea(
//                   child: SizedBox(
//                     width: double.infinity,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: getProportionateScreenWidth(20)),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             SizedBox(height: SizeConfig.screenHeight * 0.04),
//                             Form(
//                               key: _formKey,
//                               child: Column(
//                                 children: [
//                                   buildFullnameFormField(user?.user_fullname),
//                                   SizedBox(
//                                       height: getProportionateScreenHeight(30)),
//                                   buildEmailFormField(user?.user_email),
//                                   SizedBox(
//                                       height: getProportionateScreenHeight(30)),
//                                   buildPhoneNumberFormField(
//                                       user?.user_phone_number),
//                                   SizedBox(
//                                       height: getProportionateScreenHeight(30)),
//                                   buildAddressFormField(user?.user_address),
//                                   SizedBox(
//                                       height: getProportionateScreenHeight(30)),
//                                   Text(
//                                     "Thông tin ngân hàng được dùng để HOÀN LẠI phí đảm bảo tài sản",
//                                     textAlign: TextAlign.center,
//                                   ),
//                                   SizedBox(
//                                       height: getProportionateScreenHeight(30)),
//                                   buildBankAccountNumberFormField(
//                                       user?.user_bank_account_number),
//                                   SizedBox(
//                                       height: getProportionateScreenHeight(30)),
//                                   buildBankNameFormField(user?.user_bank_name),
//                                   FormError(errors: errors),
//                                   SizedBox(
//                                       height: getProportionateScreenHeight(40)),
//                                   DefaultButton(
//                                     text: "Lưu",
//                                     press: () async {
//                                       if (_formKey.currentState!.validate()) {
//                                         _formKey.currentState!.save();

//                                         KeyboardUtil.hideKeyboard(context);
//                                         bool? success = await updateUser(
//                                           BaseSharedPreferences.getString(
//                                               'user_id'),
//                                           widget.fullnameText.text,
//                                           widget.emailText.text,
//                                           widget.phoneNumberText.text,
//                                           widget.addressText.text,
//                                           widget.bankAccountNumberText.text,
//                                           widget.bankNameText.text,
//                                         );
//                                         if (success == true) {
//                                           _dismissDialog() {
//                                             Navigator.pop(context);
//                                             Navigator.pop(context);
//                                           }

//                                           showDialog(
//                                               context: context,
//                                               builder: (context) {
//                                                 return AlertDialog(
//                                                   title: Text('Thông báo!'),
//                                                   content: Text(
//                                                       'Cập nhật thành công.'),
//                                                   actions: <Widget>[
//                                                     TextButton(
//                                                       onPressed: () {
//                                                         removeError(
//                                                             error:
//                                                                 "Không thể cập nhật thông tin.\nvui lòng thử lại!");
//                                                         _dismissDialog();
//                                                       },
//                                                       child: Text('Đóng'),
//                                                     ),
//                                                   ],
//                                                 );
//                                               });
//                                         } else
//                                           addError(
//                                               error:
//                                                   "Không thể cập nhật thông tin.\nvui lòng thử lại!");
//                                         // if all are valid then go to success screen
//                                         // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
//                                       }
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: SizeConfig.screenHeight * 0.08),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               }
//           }
//         });

//     // return Form(
//     //   key: _formKey,
//     //   child: Column(
//     //     children: [
//     //       SizedBox(height: getProportionateScreenHeight(30)),
//     //       buildFullnameFormField(),
//     //       SizedBox(height: getProportionateScreenHeight(30)),
//     //       buildEmailFormField(),
//     //       SizedBox(height: getProportionateScreenHeight(30)),
//     //       buildPasswordFormField(),
//     //       SizedBox(height: getProportionateScreenHeight(30)),
//     //       buildConformPassFormField(),
//     //       FormError(errors: errors),
//     //       SizedBox(height: getProportionateScreenHeight(40)),
//     //       // DefaultButton(
//     //       //   text: "Tiếp tục",
//     //       //   press: () async {
//     //       //     if (_formKey.currentState!.validate()) {
//     //       //       _formKey.currentState!.save();

//     //       //       KeyboardUtil.hideKeyboard(context);
//     //       //       // if all are valid then go to success screen
//     //       //       // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
//     //       //     }
//     //       //   },
//     //       // ),
//     //     ],
//     //   ),
//     // );
//   }

//   TextFormField buildBankNameFormField(String? text) {
//     widget.bankNameText.text = text ?? '';
//     return TextFormField(
//       controller: widget.bankNameText,
//       keyboardType: TextInputType.text,
//       onSaved: (newValue) => widget.bankName = newValue,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: 'Tên ngân hàng không được trống');
//         }
//         return null;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: 'Tên ngân hàng không được trống');
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Tên ngân hàng",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//     );
//   }

//   TextFormField buildBankAccountNumberFormField(String? text) {
//     widget.bankAccountNumberText.text = text ?? '';
//     return TextFormField(
//       controller: widget.bankAccountNumberText,
//       keyboardType: TextInputType.text,
//       onSaved: (newValue) => widget.bankAccountNumber = newValue,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: 'Số tài khoản không được trống');
//         }
//         return null;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: 'Số tài khoản không được trống');
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Số tài khoản ngân hàng",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//     );
//   }

//   TextFormField buildAddressFormField(String? text) {
//     widget.addressText.text = text ?? '';
//     return TextFormField(
//       controller: widget.addressText,
//       keyboardType: TextInputType.text,
//       onSaved: (newValue) => widget.address = newValue,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kAddressNullError);
//         }
//         return null;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kAddressNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Địa chỉ giao hàng",
//         hintText: "Nhập địa chỉ giao hàng",
//         // If  you are using latest version of flutter then lable text and hint text shown like this
//         // if you r using flutter less then 1.20.* then maybe this is not working properly
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         // suffixIcon:
//         //     CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
//       ),
//     );
//   }

//   TextFormField buildPhoneNumberFormField(String? text) {
//     widget.phoneNumberText.text = text ?? '';
//     return TextFormField(
//       controller: widget.phoneNumberText,
//       keyboardType: TextInputType.phone,
//       onSaved: (newValue) => widget.phoneNumber = newValue,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kPhoneNumberNullError);
//         }
//         return null;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kPhoneNumberNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Số điện thoại",
//         hintText: "Nhập số điện thoại",
//         // If  you are using latest version of flutter then lable text and hint text shown like this
//         // if you r using flutter less then 1.20.* then maybe this is not working properly
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
//       ),
//     );
//   }

//   TextFormField buildEmailFormField(String? text) {
//     widget.emailText.text = text ?? '';
//     return TextFormField(
//       controller: widget.emailText,
//       keyboardType: TextInputType.emailAddress,
//       onSaved: (newValue) => widget.email = newValue,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kEmailNullError);
//         } else if (emailValidatorRegExp.hasMatch(value)) {
//           removeError(error: kInvalidEmailError);
//         }
//         return null;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kEmailNullError);
//           return "";
//         } else if (!emailValidatorRegExp.hasMatch(value)) {
//           addError(error: kInvalidEmailError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Email",
//         hintText: "Nhập địa chỉ email",
//         // If  you are using latest version of flutter then lable text and hint text shown like this
//         // if you r using flutter less then 1.20.* then maybe this is not working properly
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
//       ),
//     );
//   }

//   TextFormField buildFullnameFormField(String? text) {
//     widget.fullnameText.text = text ?? '';
//     return TextFormField(
//       controller: widget.fullnameText,
//       keyboardType: TextInputType.text,
//       onSaved: (newValue) => widget.fullname = newValue,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kNamelNullError);
//         }
//         return null;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kNamelNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Họ tên",
//         hintText: "Nhập họ tên của bạn",
//         // If  you are using latest version of flutter then lable text and hint text shown like this
//         // if you r using flutter less then 1.20.* then maybe this is not working properly
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
//       ),
//     );
//   }
// }
