import 'package:flutter/material.dart';

import '../res/color.dart';
import '../res/components/button.dart';
import '../utils/routes/route_name.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orangeColor,
        centerTitle: true,
        title: Text(
          'SignUp',
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
          MyButton(title: 'SignUp', onPressed: () {}),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.login);
            },
            child: Text(
              "Already have an account? Login here",
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
