import "package:flutter/material.dart";
import "package:flutter/widgets.dart";


showSnackBar({required BuildContext context, required String texto, bool isErro = true}){
  SnackBar snackBar = SnackBar(
    content: Text(texto),
    backgroundColor: (isErro) ? Colors.red : Colors.green,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
    duration: Duration(seconds: 4),
    action: SnackBarAction(
      label: "Ok", 
      textColor: Colors.white,
      onPressed: () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }),
    );


    ScaffoldMessenger.of(context).showSnackBar(snackBar);
}