// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

class Res {
  final String success;

  Res(this.success);
  Res.fromJson(Map<String, dynamic> json) : success = json['success'];
  Map<String, dynamic> toJson() => {
        'success': success,
      };
}

class User {
  late String idUser;
  late String firstName;
  late String lastName;
  late String? address;
  late String email;
  late String password;
  late String? phoneNumber;
  // final String? user_token;

  User(this.idUser, this.firstName, this.lastName, this.address, this.email,
      this.password, this.phoneNumber);
  User.fromJson(Map<String, dynamic> json)
      : idUser = json['idUser'].toString(),
        firstName = json['firstName'],
        lastName = json['lastName'],
        address = json['address'],
        email = json['email'],
        password = json['password'],
        phoneNumber = json['phoneNumber'];
  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'firstName': firstName,
        'lastName': lastName,
        'address': address,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
      };
}

class ProductType {
  late String idProductType;
  late String typeName;
  //final int product_type_quantity;

  ProductType(
    this.idProductType,
    this.typeName,
    //this.product_type_quantity
  );
  ProductType.fromJson(Map<String, dynamic> json)
      : idProductType = json['idProductType'],
        typeName = json['typeName'];
  //product_type_quantity = int.parse(json['product_type_quantity']);
  Map<String, dynamic> toJson() => {
        'idProductType': idProductType,
        'typeName': typeName,
        //'product_type_quantity': product_type_quantity,
      };
}

class Product {
  late String idProduct;
  late String productName;
  late String productQuantity;
  late String productUrlImage;
  late String? idProductType;
  late String? productSize;
  late String productRentalPrice;
  late String? productDescription;
  late String? typeName;
  late String productPrice;
  late String? productWeight;

  Product(
      this.idProduct,
      this.productName,
      this.productQuantity,
      this.productUrlImage,
      this.idProductType,
      this.productSize,
      this.productRentalPrice,
      this.productDescription,
      this.typeName,
      this.productPrice,
      this.productWeight);
  Product.fromJson(Map<String, dynamic> json)
      : idProduct = json['idProduct'].toString(),
        productName = json['productName'],
        idProductType = json['idProductType'].toString(),
        productPrice = json['productPrice'].toString(),
        productRentalPrice = json['productRentalPrice'].toString(),
        productUrlImage = json['productUrlImage'].toString(),
        productQuantity = json['productQuantity'].toString(),
        productSize = json['productSize'].toString(),
        productWeight = json['productWeight'].toString(),
        productDescription = json['productDescription'].toString(),
        typeName = json['typeName'].toString();
  Map<String, dynamic> toJson() => {
        'idProduct': idProduct,
        'productName': productName,
        'idProductType': idProductType,
        'productPrice': productPrice,
        'productRentalPrice': productRentalPrice,
        'productUrlImage': productUrlImage,
        'productQuantity': productQuantity,
        'idProductSize': productSize,
        'productWeight': productWeight,
        'productDescription': productDescription,
        'typeName': typeName,
      };
}

class Cart {
  late String idProduct;
  late String productName;
  late String productUrlImage;
  late String idProductType;
  late String? productSize;
  late int productRentalPrice;
  late String productDescription;
  late int productPrice;
  late int productQuantity;
  late int productWeight;
  late int cartProductQuantity;
  // p.idProduct, p.productName,p.productRentalPrice, p.productUrlImage, p.productQuantity, p.productWeight, c.cartProductQuantity from cart as c, product as p where idUser = ? and c.idProduct = p.idProduct
  Cart(
      this.idProduct,
      this.productName,
      this.productUrlImage,
      this.idProductType,
      this.productSize,
      this.productDescription,
      this.productPrice,
      this.productRentalPrice,
      this.productQuantity,
      this.productWeight,
      this.cartProductQuantity);
  Cart.fromJson(Map<String, dynamic> json)
      : idProduct = json['idProduct'].toString(),
        productName = json['productName'],
        productQuantity = json['productQuantity'],
        productUrlImage = json['productUrlImage'],
        idProductType = json['idProductType'].toString(),
        productSize = json['productSize'],
        productRentalPrice = json['productRentalPrice'],
        productDescription = json['productDescription'],
        productPrice = (json['productPrice']),
        productWeight = (json['productWeight']),
        cartProductQuantity = (json['cartProductQuantity']);
  Map<String, dynamic> toJson() => {
        'idProduct': idProduct,
        'productName': productName,
        'productQuantity': productQuantity,
        'productUrlImage': productUrlImage,
        'idProductType': idProductType,
        'productSize': productSize,
        'productRentalPrice': productRentalPrice,
        'productDescription': productDescription,
        'productPrice': productPrice,
        'productWeight': productWeight,
        'cartProductQuantity': cartProductQuantity,
      };
}

class Invoice {
  final String invoice_id;
  final String invoice_user_fullname;
  final String invoice_user_phone_number;
  final String invoice_user_email;
  final int invoice_subtotal;
  final int invoice_fee_transport;
  final int invoice_fee_bond;
  final int invoice_status_id;
  final String invoice_status_name;
  final int invoice_num_rental_days;
  final String invoice_created_at;
  Invoice(
      this.invoice_id,
      this.invoice_user_fullname,
      this.invoice_user_phone_number,
      this.invoice_user_email,
      this.invoice_subtotal,
      this.invoice_fee_transport,
      this.invoice_fee_bond,
      this.invoice_status_id,
      this.invoice_status_name,
      this.invoice_num_rental_days,
      this.invoice_created_at);
  Invoice.fromJson(Map<String, dynamic> json)
      : invoice_id = json['invoice_id'],
        invoice_user_fullname = json['invoice_user_fullname'],
        invoice_user_phone_number = json['invoice_user_phone_number'],
        invoice_user_email = json['invoice_user_email'],
        invoice_subtotal = int.parse(json['invoice_subtotal']),
        invoice_fee_transport = int.parse(json['invoice_fee_transport']),
        invoice_fee_bond = int.parse(json['invoice_fee_bond']),
        invoice_status_id = int.parse(json['invoice_status_id']),
        invoice_status_name = json['invoice_status_name'],
        invoice_num_rental_days = int.parse(json['invoice_num_rental_days']),
        invoice_created_at = json['invoice_created_at'];
  Map<String, dynamic> toJson() => {
        'invoice_id': invoice_id,
        'invoice_user_fullname': invoice_user_fullname,
        'invoice_user_phone_number': invoice_user_phone_number,
        'invoice_user_email': invoice_user_email,
        'invoice_subtotal': invoice_subtotal,
        'invoice_fee_transport': invoice_fee_transport,
        'invoice_fee_bond': invoice_fee_bond,
        'invoice_status_id': invoice_status_id,
        'invoice_status_name': invoice_status_name,
        'invoice_num_rental_days': invoice_num_rental_days,
        'invoice_created_at': invoice_created_at,
      };
}

class InvoiceDetails {
  final String product_id;
  final String product_name;
  final String product_img;
  final int invd_product_quantity;
  final int invd_product_rental_price;
  InvoiceDetails.fromJson(Map<String, dynamic> json)
      : product_id = json['product_id'],
        product_name = json['product_name'],
        product_img = json['product_img'],
        invd_product_quantity = int.parse(json['invd_product_quantity']),
        invd_product_rental_price =
            int.parse(json['invd_product_rental_price']);
  Map<String, dynamic> toJson() => {
        'product_id': product_id,
        'product_name': product_name,
        'product_img': product_img,
        'invd_product_quantity': invd_product_quantity,
        'invd_product_rental_price': invd_product_rental_price,
      };
}
