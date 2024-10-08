import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function? onTap;
  final Color? btnColor;
  final Color? txtColor;
  final double? fontSize;
  final double horizontalPadding;
  final double verticalPadding;
  final double? borderRadius;
  final bool inProgress;

  const MainButton(
      {super.key,
      required this.text,
      this.onTap,
      this.btnColor = Colors.red,
      this.txtColor = Colors.white,
      this.horizontalPadding = 8,
      this.inProgress = false,
      this.verticalPadding = 8,
      this.borderRadius,
      this.fontSize = 18, required Null Function() onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(btnColor),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inProgress
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.white24,
                        strokeWidth: 2,
                      ))
                  : Text(
                      text,
                      style: TextStyle(color: txtColor, fontSize: fontSize),
                    ),
            ],
          ),
        ));
  }
}
