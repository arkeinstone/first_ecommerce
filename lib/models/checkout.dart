import 'package:equatable/equatable.dart';
import 'package:first_ecommerce_app/models/models.dart';

class Checkout extends Equatable {
  final String? name;
  final String? email;
  final String? address;
  final String? phone;
  final List<Product>? products;
  final String? subtotal;
  final String? shippingFee;
  final String? total;
  const Checkout({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.products,
    required this.subtotal,
    required this.shippingFee,
    required this.total});

  @override
  List<Object?> get props => [name, email, address, phone, products, subtotal, shippingFee, total];

  Map<String, dynamic> toDocument(String id){
    Map productMap = {};
    return {
      'id': id,
      'customerName': name!,
      'customerEmail': email!,
      'customerAddress': address!,
      'customerPhone': phone!,
      'products': getProducts(products, productMap),
      'subtotal': subtotal!,
      'shippingFee': shippingFee!,
      'total': total!,
      'date': DateTime.now(),
      'isAccept': false,
    };
  }
  Map getProducts(List<Product>? products, Map map){
    products!.map((product){
      int count = products.where((pro) => pro.id == product.id).toList().length;
      map[product.id] = count;
    }).toList();
    return map;
  }
}
