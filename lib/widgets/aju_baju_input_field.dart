import 'package:flutter/material.dart';

class AjuBajuInputField extends StatelessWidget {
  final String textHint;
  final String imageAddress;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  const AjuBajuInputField(
      {super.key,
      required this.imageAddress,
      required this.textHint,
      this.controller,
      this.autovalidateMode,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller,
        autovalidateMode: autovalidateMode,
        validator: validator,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Container(
                height: 45.0,
                width: 48.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFF67952).withOpacity(0.1),
                ),
                child: Image.asset(
                  imageAddress,
                  scale: 3,
                )),
          ),
          hintText: textHint,
        ),
      ),
    );
  }
}
