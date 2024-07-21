import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.prefixIcon,
      this.isPassword = false,this.controller});

  final String hint;
  final IconData? prefixIcon;
  final bool isPassword;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword
            ? isVisible
                ? true
                : false
            : false,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
        cursorColor: Colors.grey.shade300,
        decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.grey.shade300),
            prefixIcon: widget.prefixIcon == null
                ? null
                : Icon(
                    widget.prefixIcon,
                    color: Colors.grey.shade300,
                  ),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                      isVisible
                          ? Icons.visibility
                          : Icons.visibility_off_rounded,
                      color: Colors.grey.shade300,
                    ),
                  )
                : null,
            fillColor: Colors.grey.shade600,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
