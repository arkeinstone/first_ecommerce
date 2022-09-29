import 'package:first_ecommerce_app/models/models.dart';

abstract class BaseCheckoutRepository{
  Future<void> addCheckout(Checkout checkout, String docId);
}