import 'package:flutter/material.dart';
import 'package:imdb_app/res/color.dart';
import 'package:imdb_app/views/components/button.dart';
import 'package:imdb_app/utils/routes/route_name.dart';
import 'package:imdb_app/view_model/auth_view_model.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final AuthViewModel authViewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orangeColor,
        centerTitle: true,
        title: Text(
          'Login',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: AppColors.orangeColor)),
                )),
          ),
          ValueListenableBuilder(
            valueListenable: _obsecurePassword,
            builder: (context, value, child) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                obscureText: _obsecurePassword.value,
                controller: _passwordController,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors.orangeColor)),
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Password',
                    focusColor: AppColors.orangeColor,
                    hoverColor: AppColors.orangeColor,
                    fillColor: AppColors.orangeColor,
                    suffixIcon: InkWell(
                      onTap: () {
                        _obsecurePassword.value = !_obsecurePassword.value;
                      },
                      child: _obsecurePassword.value
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          MyButton(
              title: 'Login',
              onPressed: () {
                if (_emailController.text.isEmpty) {
                  Utils.snackbar('Please enter valid email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.snackbar('Please enter password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.snackbar('Password must be at least 6 digit', context);
                } else {
                  print('login called');
                  authViewModel.signInWithEmailAndPassword(
                      _emailController.text, _passwordController.text, context);
                }
              }),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.signUp);
            },
            child: Text(
              "Don't have an account? SignUp here",
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
