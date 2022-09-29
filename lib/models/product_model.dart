import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final num price;
  final bool isRecommended;
  final bool isPopular;
  const Product({required this.id, required this.name, required this.category, required this.imageUrl, required this.price, required this.isRecommended, required this.isPopular});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, category, imageUrl, price, isRecommended, isPopular];

  static Product fromSnapShot(DocumentSnapshot snapshot){
    Product product = Product(id: snapshot['id'], name: snapshot['name'], category: snapshot['category'], imageUrl: snapshot['imageUrl'], price: snapshot['price'], isRecommended: snapshot['isRecommended'], isPopular: snapshot['isPopular']);
    return product;
  }
}