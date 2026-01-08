import 'package:flutter/material.dart';

class CustomFormWidget extends StatefulWidget {
  final bool obsecureText;
  final String hintText;
  final String? Function(String?) validator;
  final Function(String?) onSaved;

  const CustomFormWidget({
    super.key,
    this.obsecureText = false,
    required this.hintText,
    required this.validator,
    required this.onSaved,
  });

  @override
  State<CustomFormWidget> createState() => _CustomFormWidgetState();
}

class _CustomFormWidgetState extends State<CustomFormWidget> {
  late bool _isObscured;
  @override
  void initState() {
    super.initState();
    _isObscured = widget.obsecureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: TextFormField(
        obscureText: _isObscured,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.obsecureText? IconButton(
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
            icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
          ):null
        ),
        validator: widget.validator,
        onSaved: widget.onSaved,
      ),
    );
  }
}
