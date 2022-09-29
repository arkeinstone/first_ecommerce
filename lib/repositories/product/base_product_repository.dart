import 'package:first_ecommerce_app/models/models.dart';

abstract class BaseProductRepository{
  Stream<List<Product>> getAllProducts();
}