import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String hintText;
  final bool obscure;
  final TextEditingController? controller;

  const CustomInput({
    super.key,
    required this.hintText,
    required this.obscure,
    this.controller,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscure;
  }

  void _toggleVisibility() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscure ? _obscure : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon:
            widget.obscure
                ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _toggleVisibility,
                )
                : null,
      ),
    );
  }
}
