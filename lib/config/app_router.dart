import 'package:first_ecommerce_app/screens/screens.dart';
import 'package:first_ecommerce_app/models/models.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return PageTransition(
          type: PageTransitionType.fade,
          child: RootApp(),
        );
      case '/intro':
        return PageTransition(
          type: PageTransitionType.fade,
          child: IntroductionScreen(),
        );
      case '/home':
        return PageTransition(
          type: PageTransitionType.fade,
          child: HomeScreen(),
        );
      case '/cart':
        return PageTransition(
          type: PageTransitionType.fade,
          child: CartScreen(),
        );
      case '/product':
        return PageTransition(
          type: PageTransitionType.fade,
          child: ProductScreen(),
        );
      case '/wishlist':
        return PageTransition(
          type: PageTransitionType.fade,
          child: WishListScreen(),
        );
      case '/detail':
        return PageTransition(
          type: PageTransitionType.fade,
          child: DetailScreen(product: settings.arguments as Product),
        );
      case '/checkout':
        return PageTransition(
          type: PageTransitionType.fade,
          child: CheckoutScreen(),
        );
      case '/order-confirmation':
        return PageTransition(
          type: PageTransitionType.fade,
          child: OrderConfirmationScreen(documentId: settings.arguments as String),
        );
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error'),),
      ),
    );
  }
}