import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultTextFormField({
  required String label,
  IconData? prefix,
  IconData? suffix,
  double radius = 0.0,
  required TextInputType textInputType,
  required var controller,
  var onSubmitted,
  var onChange,
  Function()? onTap,
  required validate,
  var onSuffixPressed,
  bool isPassword = false,
}) =>
    TextFormField(
      obscureText: isPassword,
      validator: validate,
      controller: controller,
      onFieldSubmitted: onSubmitted,
      onChanged: onChange,
      onTap: onTap,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: onSuffixPressed,
              )
            : null,
      ),
    );

Widget spaceInHeight({required double height}) => SizedBox(height: height);
Widget spaceInWidth({required double width}) => SizedBox(width: width);
void navigateTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );
Widget defaultTextButton({
  required String text,
  required Function() function,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: Colors.amber),
      ),
    );
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required Function() function,
  required String text,
  bool isUpperCase = true,
  double radius = 0.0,
}) =>
    Container(
      height: 40.0,
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );

void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
    (route) => false);
void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}
