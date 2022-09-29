import 'package:equatable/equatable.dart';
import 'package:first_ecommerce_app/models/models.dart';

class Cart extends Equatable{
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  Map productQuantity(List<Product> products){
    //products.sort((a, b) => a.name.compareTo(b.name));
    List<Product> productsList = List.from(products);
    productsList.sort((a, b) => a.name.compareTo(b.name),);
    var quantity = {};
    for (var product in productsList) {
      if(!quantity.containsKey(product)){
        quantity[product] = 1;
      }else{
        quantity[product] += 1;
      }
    }
    return quantity;
  }

  double get subtotal => products.fold(0, (total, current) => total + current.price);
  double shippingFee(subtotal){
    if(subtotal >= 100.0){
      return 0.0;
    }else{
      return 10.0;
    }
  }
  String freeShipping(subtotal){
    if(subtotal >= 100.0){
      return 'You Get Free Shipping';
    }else{
      double fee = 100.0 - subtotal;
      return 'Add ${fee.toStringAsFixed(2)}\$ for FREE Ship';
    }
  }

  double finalTotal(subtotal, shippingFee){
    return subtotal + shippingFee(subtotal);
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get shippingFeeString => shippingFee(subtotal).toStringAsFixed(2);
  String get freeShippingString => freeShipping(subtotal);
  String get finalTotalString => finalTotal(subtotal, shippingFee).toStringAsFixed(2);

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}