import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

alertDialog(BuildContext context,String msg){
Fluttertoast.showToast(
msg: msg,
toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.CENTER,
timeInSecForIosWeb: 1,
backgroundColor: Colors.red,
textColor: Colors.white,
fontSize: 16.0
);
}

// valideateEmail(){
//   final ReqExp emailReg= new RegExp(source)
// }
