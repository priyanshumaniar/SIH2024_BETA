import 'package:flutter/material.dart';

class AjuBajuButton extends StatelessWidget {
  final String buttonName;
  final double height;
  final double width;
  final void Function()? onTap;

  const AjuBajuButton(
      {super.key,
      this.height = 59,
      this.width = 205,
      required this.buttonName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(133.0),
            color: const Color(0xFFF67952)),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: "Gordita",
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                fontStyle: FontStyle.normal),
          ),
        ),
      ),
    );
  }
}
