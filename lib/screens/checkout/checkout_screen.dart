import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_ecommerce_app/blocs/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_ecommerce_app/widgets/widgets.dart';
import 'package:first_ecommerce_app/config/config.dart';

class CheckoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? documentId;
    final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: 'Checkout Screen', inCartScreen: true),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 50,
          child: Center(
            child: BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state){
                if(state is CheckoutLoading){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(state is CheckoutLoaded){
                  return ElevatedButton(
                    onPressed: () async{
                      if(_formKey.currentState!.validate()){
                        final randomId = _firebaseFirestore.collection('checkout').doc().id;
                        context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout, docId: randomId));
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Text('Order Now', style: Theme.of(context).textTheme.headline3,),
                  );
                }else{
                  return Container();
                }
              },
            )
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: AppTheme.paddingAll20,
          child: BlocConsumer<CheckoutBloc, CheckoutState>(
            listener: (context, state){
              if(state is CheckoutSuccess){
                documentId = state.docId;
                Navigator.pushNamedAndRemoveUntil(context, '/order-confirmation', (route) => false, arguments: documentId);
              }
            },
            builder: (context, state){
              if(state is CheckoutLoading){
                return const Center(child: CircularProgressIndicator(),);
              }if(state is CheckoutLoaded){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CUSTOMER INFORMATION', style: Theme.of(context).textTheme.headline3,),
                    CustomTextFormField(
                      onChanged: (value){context.read<CheckoutBloc>().add(UpdateCheckout(name: value));},
                      context: context, label: 'Full Name',
                      inputType: TextInputType.text,
                      validateEmpty: 'Please enter your name',
                      validateEmail: false, validatePhone: false
                    ),
                    CustomTextFormField(
                      onChanged: (value){context.read<CheckoutBloc>().add(UpdateCheckout(email: value));},
                      context: context, label: 'Email',
                      inputType: TextInputType.emailAddress,
                      validateEmpty: 'Please enter your email',
                      validateEmail: true, validatePhone: false
                    ),
                    Text('DELIVERY INFORMATION', style: Theme.of(context).textTheme.headline3,),
                    CustomTextFormField(
                      onChanged: (value){context.read<CheckoutBloc>().add(UpdateCheckout(address: value));},
                      context: context, label: 'Address',
                      inputType: TextInputType.streetAddress,
                      validateEmpty: 'Please enter your address',
                      validateEmail: false, validatePhone: false
                    ),
                    CustomTextFormField(
                      onChanged: (value){context.read<CheckoutBloc>().add(UpdateCheckout(phone: value));},
                      context: context, label: 'Phone',
                      inputType: TextInputType.number,
                      validateEmpty: 'Please enter your phone number',
                      validateEmail: false, validatePhone: true
                    ),
                    Text('ORDER SUMMARY', style: Theme.of(context).textTheme.headline3,),
                    OrderSummary(),
                  ],
                );
              }else if(state is CheckoutError){
                return Center(child: Text(state.error.toString()),);
              }else{
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

