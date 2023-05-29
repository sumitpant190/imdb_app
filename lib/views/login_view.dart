import 'package:flutter/material.dart';
import 'package:imdb_app/res/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  focusColor: AppColors.orangeColor,
                  hoverColor: AppColors.orangeColor),
            ),
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
          )
        ],
      ),
    );
  }
}
