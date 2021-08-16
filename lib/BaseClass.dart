import 'package:flutter/material.dart';
class BaseClass
{
  BaseClass();
  showAlertDialog(BuildContext context,String msg) {
    // Create button
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Response"),
      content: Text(msg),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  Widget textForm(String hint,String errorMs,bool isobscureText,double radius,double borderWidth,Icon icon,TextEditingController inputController)
  {
    return TextField(
      obscureText: isobscureText,
      controller: inputController,
      decoration: InputDecoration(
          hintText: hint,
          errorText: errorMs,

          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            borderSide: BorderSide(width: borderWidth, color: Colors.blue),
          ),

          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide:
              BorderSide(width: borderWidth, color: Colors.black)),

          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(width: borderWidth, color: Colors.green)),
          prefixIcon: icon
      ),
    );
  }


  //show Dialog


}