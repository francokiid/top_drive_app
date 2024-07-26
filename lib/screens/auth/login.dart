import 'package:flutter/material.dart';
import 'package:top_drive_app/constants/colors.dart';

import '../../constants/sizes.dart';
import '../../constants/styles.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  bool rememberUser = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildTop(),
              _buildBottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      height: kToolbarHeight * 3,
      child: Center(
        child: Image.asset('assets/images/top_drive_logo.png',
          fit: BoxFit.cover,
          height: kToolbarHeight * 2,
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return Card(
      color: whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: pagePadding,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("TOP DRIVE", style: orangePageTitle),
              normalText("Hello! Enter your credentials below."),
              largeVSpace,
              largeVSpace,
              normalText("Email"),
              _buildEmailField(emailController),
              mediumVSpace,
              normalText("Password"),
              _buildPasswordInputField(),
              mediumVSpace,
              _buildRememberForgot(),
              largeVSpace,
              _buildLoginButton(),
              largeVSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?', style: smallestBlack,),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    child: const Text('REGISTER.', style: linkText)),
                ],
              ),
              largeVSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field cannot be empty';
        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
          return 'Invalid email format';
        } return null;
      },
    );
  }

  Widget _buildPasswordInputField() {
    return TextFormField(
      controller: passwordController,
      obscureText: _obscureText,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Field cannot be empty";
        } return null;
      },
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberUser,
              activeColor: primaryColor,
              onChanged: (value) {
                setState(() {
                  rememberUser = value!;
                });
              },
            ),
            Text("Remember me", style: smallestBlack,),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text("Forgot password?", style: smallestBlack,),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          String email = emailController.text;
          String password = passwordController.text;

          if (email == 'student@gmail.com' && password == 'password') {
            Navigator.pushReplacementNamed(context, '/student');
          } else if (email == 'instructor@gmail.com' && password == 'password') {
            Navigator.pushReplacementNamed(context, '/instructor');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Invalid email or password. Please try again.'),
                duration: Duration(seconds: 3),
              ),
            );
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: blackColor,
        shape: const StadiumBorder(),
        elevation: 10,
        minimumSize: const Size.fromHeight(60),
      ),
      child: Text("LOGIN", style: mediumWhiteBold),
    );
  }
}
