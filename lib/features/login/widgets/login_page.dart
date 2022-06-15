import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/features/app/router/router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _buttonTap() {
    context.router.replaceAll(
      const [
        MainRoute(),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(
          Constants.mediumPadding,
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: Constants.smallPadding,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(
                  height: Constants.mediumPadding,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text(
                      'Login',
                    ),
                    onPressed: _buttonTap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
