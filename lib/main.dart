import 'package:firebase_core/firebase_core.dart';
import 'package:first_ecommerce_app/blocs/bloc.dart';
import 'package:first_ecommerce_app/config/config.dart';
import 'package:first_ecommerce_app/repositories/repositories.dart';
import 'repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  // Set status bar color into black
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WishlistBloc>(create: (context) => WishlistBloc()..add(LoadWishList())),
        BlocProvider<CartBloc>(create: (context) => CartBloc()..add(LoadCart())),
        BlocProvider<CategoryBloc>(create: (context) =>
          CategoryBloc(categoryRepository: CategoryRepository())..add(LoadCategories())),
        BlocProvider<ProductBloc>(create: (context) =>
          ProductBloc(productRepository: ProductRepository())..add(LoadProducts())),
        BlocProvider<CheckoutBloc>(create: (context) =>
          CheckoutBloc(cartBloc: context.read<CartBloc>(), checkoutRepository: CheckoutRepository())),
      ],
      child: MaterialApp(
        title: 'First eCommerce App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: '/intro', // The first time app runs, intro screen will display first
        theme: theme(),
      ),
    );
  }
}






