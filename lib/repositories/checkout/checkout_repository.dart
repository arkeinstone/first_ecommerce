import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_ecommerce_app/models/models.dart';
import 'package:first_ecommerce_app/repositories/checkout/base_checkout_repository.dart';

class CheckoutRepository extends BaseCheckoutRepository{
  final FirebaseFirestore _firebaseFirestore;
  CheckoutRepository({FirebaseFirestore? firebaseFirestore}) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Future<String> addCheckout(Checkout checkout, String docId) async{
    // String? docId;
    // await _firebaseFirestore.collection('checkout').add(checkout.toDocument()).then((value){
    //   docId = value.id;
    // });
    // return docId!;
    await _firebaseFirestore.collection('checkout').doc(docId).set(checkout.toDocument(docId));
    return docId;
  }
}