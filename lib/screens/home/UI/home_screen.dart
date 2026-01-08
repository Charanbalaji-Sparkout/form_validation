import 'package:flutter/material.dart';
import 'package:form_validation/screens/home/widgets/custom_form_widget.dart';
import 'package:form_validation/screens/home/widgets/regular_expression_widget.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formkey = GlobalKey<FormState>();
  bool _showDetails = false;

  String? email, password, phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Validation')),
      body: _Uiwidget(),
    );
  }

  Widget _Uiwidget() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              CustomFormWidget(
                hintText: "Email",
                validator: (val) {
                  if (!val!.isValidEmail) {
                    return 'Enter a Valid Email';
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              CustomFormWidget(
                hintText: "Phone",
                obsecureText: false,
                validator: (val) {
                  if (!val!.isValidPhone) {
                    return 'Enter a Valid Phone Number';
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    phone = val;
                  });
                },
              ),
              CustomFormWidget(
                hintText: "Password",
                obsecureText: true,
                validator: (val) {
                  if (val == null || !val.isValidPassword) {
                    return 'Enter a Valid Password';
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      if (email != null && password != null && phone != null) {
                        _showDetails = !_showDetails;
                      }
                    }
                  });
                },
                child: Text('Register'),
              ),
              if (_showDetails &&
                  email != null &&
                  password != null &&
                  phone != null) ...[
                Text("Your email is ${email ?? ''}"),
                Text("Your number is ${phone ?? ''}"),
                Text("Your password is ${password ?? ''}"),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
