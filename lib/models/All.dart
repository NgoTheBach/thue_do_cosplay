// ignore_for_file: non_constant_identifier_names

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
  final String product_type_id;
  final String product_type_name;
  final int product_type_quantity;

  ProductType(
      this.product_type_id, this.product_type_name, this.product_type_quantity);
  ProductType.fromJson(Map<String, dynamic> json)
      : product_type_id = json['product_type_id'],
        product_type_name = json['product_type_name'],
        product_type_quantity = int.parse(json['product_type_quantity']);
  Map<String, dynamic> toJson() => {
        'product_type_id': product_type_id,
        'product_type_name': product_type_name,
        'product_type_quantity': product_type_quantity,
      };
}

class Product {
  final String idProduct;
  final String productName;
  final String? idProductType;
  final String? typeName;
  final int? productPrice;
  final int productRentalPrice;
  final String productUrlImage;
  final int? productQuantity;
  final String? idProductSize;
  final int? productDescription;

  Product(
      this.idProduct,
      this.productName,
      this.idProductType,
      this.typeName,
      this.productPrice,
      this.productRentalPrice,
      this.productUrlImage,
      this.productQuantity,
      this.idProductSize,
      this.productDescription);
  Product.fromJson(Map<String, dynamic> json)
      : idProduct = json['idProduct'],
        productName = json['productName'],
        idProductType = json['idProductType'],
        typeName = json['typeName'],
        productPrice = int.parse(json['productPrice']),
        productRentalPrice = int.parse(json['productRentalPrice']),
        productUrlImage = json['productUrlImage'],
        productQuantity = int.parse(json['productQuantity']),
        idProductSize = json['idProductSize'],
        productDescription = json['productDescription'];
  Map<String, dynamic> toJson() => {
        'idProduct': idProduct,
        'productName': productName,
        'idProductType': idProductType,
        'typeName': typeName,
        'productPrice': productPrice,
        'productRentalPrice': productRentalPrice,
        'productUrlImage': productUrlImage,
        'productQuantity': productQuantity,
        'idProductSize': idProductSize,
        'productDescription': productDescription,
      };
}

class Cart {
  final String product_id;
  final String product_name;
  final int product_rental_price;
  final String product_img;
  final int product_quantity;
  final int product_weight;
  final int cart_product_quantity;

  Cart(
      this.product_id,
      this.product_name,
      this.product_rental_price,
      this.product_img,
      this.product_quantity,
      this.product_weight,
      this.cart_product_quantity);
  Cart.fromJson(Map<String, dynamic> json)
      : product_id = json['product_id'],
        product_name = json['product_name'],
        product_rental_price = int.parse(json['product_rental_price']),
        product_img = json['product_img'],
        product_quantity = int.parse(json['product_quantity']),
        product_weight = int.parse(json['product_weight']),
        cart_product_quantity = int.parse(json['cart_product_quantity']);
  Map<String, dynamic> toJson() => {
        'product_id': product_id,
        'product_name': product_name,
        'product_rental_price': product_rental_price,
        'product_img': product_img,
        'product_quantity': product_quantity,
        'product_weight': product_weight,
        'cart_product_quantity': cart_product_quantity,
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
