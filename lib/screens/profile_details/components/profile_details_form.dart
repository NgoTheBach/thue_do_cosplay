import 'package:flutter/material.dart';
import 'package:thue_do_cosplay/api/user.dart';
import 'package:thue_do_cosplay/components/default_button.dart';
import 'package:thue_do_cosplay/constants.dart';
import 'package:thue_do_cosplay/helper/keyboard.dart';
import 'package:thue_do_cosplay/models/All.dart';
import 'package:thue_do_cosplay/shared_preferences.dart';
import 'package:thue_do_cosplay/size_config.dart';

class ProfileDetailsForm extends StatefulWidget {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? phoneNumber;
  String? address;
  String? bankAccountNumber;
  String? bankName;

  TextEditingController firstNameText = TextEditingController();
  TextEditingController lastNameText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController phoneNumberText = TextEditingController();
  TextEditingController addressText = TextEditingController();
  TextEditingController bankAccountNumberText = TextEditingController();
  TextEditingController bankNameText = TextEditingController();

  @override
  _ProfileDetailsFormState createState() => _ProfileDetailsFormState();
}

class _ProfileDetailsFormState extends State<ProfileDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  User? user;

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
        future: getUser(BaseSharedPreferences.getString('idUser')),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading...');
            default:
              if (snapshot.hasError) {
                print('Error: ${snapshot.error}');
                return Text('Wut.');
              } else {
                user = snapshot.data;
                // print(user?.user_phone_number);
                return SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: SizeConfig.screenHeight * 0.04),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  buildFirstnameFormField(user?.firstName),
                                  SizedBox(
                                      height: getProportionateScreenHeight(30)),
                                  buildLastnameFormField(user?.lastName),
                                  SizedBox(
                                      height: getProportionateScreenHeight(30)),
                                  buildEmailFormField(user?.email),
                                  SizedBox(
                                      height: getProportionateScreenHeight(30)),

                                  // buildPhoneNumberFormField(user?.phoneNumber),
                                  // SizedBox(
                                  //     height: getProportionateScreenHeight(30)),
                                  // buildAddressFormField(user?.address),
                                  // SizedBox(
                                  //     height: getProportionateScreenHeight(30)),
                                  // Text(
                                  //   "Thông tin ngân hàng được dùng để HOÀN LẠI phí đảm bảo tài sản",
                                  //   textAlign: TextAlign.center,
                                  // ),
                                  // SizedBox(
                                  //     height: getProportionateScreenHeight(30)),
                                  // SizedBox(
                                  //     height: getProportionateScreenHeight(40)),
                                  DefaultButton(
                                    text: "Lưu",
                                    press: () async {
                                      // if (_formKey.currentState!.validate()) {
                                      // _formKey.currentState!.save();

                                      KeyboardUtil.hideKeyboard(context);

                                      bool? success = await updateUser(
                                        BaseSharedPreferences.getString(
                                            'idUser'),
                                        widget.firstNameText.text,
                                        widget.lastNameText.text,
                                        widget.emailText.text,
                                        // widget.phoneNumberText.text,
                                        // widget.addressText.text,
                                        widget.passwordText.text,
                                      );
                                      if (success == true) {
                                        _dismissDialog() {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }

                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text('Thông báo!'),
                                                content: Text(
                                                    'Cập nhật thành công.'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      removeError(
                                                          error:
                                                              "Không thể cập nhật thông tin.\nvui lòng thử lại!");
                                                      _dismissDialog();
                                                    },
                                                    child: Text('Đóng'),
                                                  ),
                                                ],
                                              );
                                            });
                                      } else
                                        addError(
                                            error:
                                                "Không thể cập nhật thông tin.\nvui lòng thử lại!");
                                      // if all are valid then go to success screen
                                      // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                                      // }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.08),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
          }
        });
  }

  TextFormField buildAddressFormField(String? text) {
    widget.addressText.text = text ?? '';
    return TextFormField(
      controller: widget.addressText,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => widget.address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Địa chỉ giao hàng",
        hintText: "Nhập địa chỉ giao hàng",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon:
        //     CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField(String? text) {
    widget.phoneNumberText.text = text ?? '';
    return TextFormField(
      controller: widget.phoneNumberText,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => widget.phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Số điện thoại",
        hintText: "Nhập số điện thoại",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField(String? text) {
    widget.emailText.text = text ?? '';
    return TextFormField(
      controller: widget.emailText,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => widget.email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Nhập địa chỉ email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField(String? text) {
    widget.passwordText.text = text ?? '';
    return TextFormField(
      controller: widget.passwordText,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => widget.password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Mật khẩu",
        hintText: "Nhập mật khẩu",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildFirstnameFormField(String? text) {
    widget.firstNameText.text = text ?? '';
    return TextFormField(
      controller: widget.firstNameText,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => widget.firstname = newValue,
      decoration: InputDecoration(
        labelText: "Tên",
        hintText: "Nhập tên của bạn",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildLastnameFormField(String? text) {
    widget.lastNameText.text = text ?? '';
    return TextFormField(
      controller: widget.lastNameText,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => widget.lastname = newValue,
      decoration: InputDecoration(
        labelText: "Họ",
        hintText: "Nhập họ của bạn",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
