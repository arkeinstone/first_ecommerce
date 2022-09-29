import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String)? onChanged;
  final BuildContext context;
  final String label;
  final TextInputType inputType;
  final String validateEmpty;
  final bool validateEmail;
  final bool validatePhone;
  CustomTextFormField({
    this.onChanged,
    required this.context,
    required this.label,
    required this.inputType,
    required this.validateEmpty,
    required this.validateEmail,
    required this.validatePhone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(label, style: Theme.of(context).textTheme.bodyText1,),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              keyboardType: inputType,
              inputFormatters: validatePhone ? [
                FilteringTextInputFormatter.digitsOnly
              ] : null,
              validator: (val) => validate(val),
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )
                )
              ),
            ),
          )
        ],
      ),
    );
  }

  String? validate(String? value){
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regEmail = RegExp(pattern);
    String phonePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regPhone = RegExp(phonePattern);
    if(value!.isEmpty){
      return validateEmpty;
    }else if(!regEmail.hasMatch(value) && validateEmail){
      return 'Invalid Email';
    }else if(!regPhone.hasMatch(value) && validatePhone){
      return 'Invalid Phone Number';
    }else{
      return null;
    }
  }
}
