import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  // we need it to check confirm password = password
  final TextEditingController? passwordController;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    this.passwordController,
  });

  static final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      width: 0.4,
      color: Colors.grey,
    ),
  );

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
            fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey),
        suffixIcon: _buildSuffixIcon(),
        enabledBorder: CustomTextFormField.outlineInputBorder,
        focusedBorder: CustomTextFormField.outlineInputBorder,
      ),
      obscureText: widget.labelText == 'Password' ||
              widget.labelText == "Confirm Password"
          ? !showPassword
          : false,
      validator: checkValidator(labelText: widget.labelText),
    );
  }

  // Method to build suffix icon based on the label text
  Widget? _buildSuffixIcon() {
    if (widget.labelText == 'Password' ||
        widget.labelText == 'Confirm Password') {
      return IconButton(
        onPressed: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
        icon: Icon(
          showPassword ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
          size: 16,
        ),
      );
    }
    return null;
  }

  // Method to return the appropriate validator based on the label text
  String? Function(String?)? checkValidator({required String labelText}) {
    if (labelText == 'E-Mail') {
      return (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
        if (!emailRegex.hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      };
    } else if (labelText == 'Password') {
      return (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        }
        return null;
      };
    } else if (labelText == 'Confirm Password') {
      return (value) {
        if (value == null || value.isEmpty) {
          return 'Please re-enter your password';
        }
        if (widget.controller.text.trim() !=
            widget.passwordController!.text.trim()) {
          return 'Passwords do not match';
        }
        return null;
      };
    }
    return null;
  }
}
