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
  final _datakey = GlobalKey<FormState>();
  bool _showDetails = false;
  bool _checkboxValue = false;

  String? email, password, phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Validation')),
      body: _Uiwidget(),
      backgroundColor: const Color.fromARGB(255, 212, 212, 212),
    );
  }

  Widget _Uiwidget() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormWidget(
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
                  imgUrl:
                      'https://i.pinimg.com/736x/dd/93/ad/dd93ad32b1b9192ced8b8fb02b61e076.jpg',
                  labelText: 'Email',
                ),
                CustomFormWidget(
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
                  imgUrl:
                      'https://i.pinimg.com/736x/c4/14/c7/c414c7a185dbabd361ef78b84aa2bfee.jpg',
                  labelText: 'Phone',
                ),
                CustomFormWidget(
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
                  imgUrl:
                      'https://i.pinimg.com/736x/c7/5b/f0/c75bf058bd3de7435aa0626637a62df5.jpg',
                  labelText: 'Password',
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Checkbox(value: _checkboxValue, onChanged: (val) {
                        setState(() {
                          _checkboxValue = val ?? false;
                        });
                      }),
                    ),
                    Text("I agree to the Terms and Conditions")
                  ],
                ),
                Center(
                  child: ElevatedButton(
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
                ),
                SizedBox(height: 40,),
                if (_showDetails &&
                    email != null &&
                    password != null &&
                    phone != null) ...[
                  Text("Your email is ${email ?? ''}",key: _datakey,),
                  Text("Your number is ${phone ?? ''}"),
                  Text("Your password is ${password ?? ''}"),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
