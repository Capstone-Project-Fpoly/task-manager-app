import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/constants/edge_insets.dart';

class CusstomTextField extends ConsumerWidget {
  final TextEditingController controller;
  final TextInputType? keyBroadType;
  final bool? isObsText;
  final String? obsCurCharacter;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CusstomTextField({
    super.key,
    required this.controller,
    this.keyBroadType = TextInputType.text,
    this.isObsText = false,
    this.obsCurCharacter = '*',
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: TextFormField(
        controller: controller,
        keyboardType: keyBroadType,
        obscureText: isObsText!,
        obscuringCharacter: obsCurCharacter!,
        decoration: InputDecoration(
          contentPadding: EdgeInsetsConstants.top12 + EdgeInsetsConstants.left8,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.065,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
    );
  }
}
