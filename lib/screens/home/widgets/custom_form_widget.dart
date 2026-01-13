import 'package:flutter/material.dart';

class CustomFormWidget extends StatefulWidget {
  final bool obsecureText;
  final String labelText;
  final String? Function(String?)? validator;
  final Function(String?) onSaved;
  final String imgUrl;
  final TextInputAction textInputAction;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;

  const CustomFormWidget({
    super.key,
    this.obsecureText = false,
    required this.onSaved,
    required this.imgUrl,
    required this.labelText,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.controller,
    this.validator,
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
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            height: 80,
            width: 350,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 226, 226, 226),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.white),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 85, right: 30),
              child: TextFormField(
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                obscureText: _isObscured,
                controller: widget.controller,
                textInputAction: widget.textInputAction,
                onFieldSubmitted: widget.onFieldSubmitted,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 184, 184, 184),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 39, 39, 39),
                      width: 1.5,
                    ),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 159, 96, 92),
                    ),
                  ),
                  labelText: widget.labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  floatingLabelStyle: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  errorStyle: TextStyle(
                    fontSize: 10
                  ),
                  suffixIcon: widget.obsecureText
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 18,
                          ),
                        )
                      : null,
                ),
                onTapOutside:(event) => FocusManager.instance.primaryFocus?.unfocus(),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: widget.validator,
                onSaved: widget.onSaved,
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                image: DecorationImage(image: NetworkImage(widget.imgUrl)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
