import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracker/common/assets/constants.dart';
import 'package:time_tracker/common/dialogs/error_dialog.dart';
import 'package:time_tracker/features/app/router/router.dart';
import 'package:time_tracker/features/login/bloc/login_bloc.dart';
import 'package:time_tracker/features/login/di/login_scope.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _buttonTap(
    BuildContext context,
  ) {
    context.read<LoginBloc>().add(
          LoginEvent.login(
            email: _emailController.text,
            password: _passwordController.text,
          ),
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
    return LoginScope(
      child: Scaffold(
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
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) => state.whenOrNull(
                      error: (error) {
                        showError(
                          context: context,
                          error: error,
                        );
                      },
                    ),
                    builder: (context, state) {
                      final button = SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          child: const Text(
                            'Login',
                          ),
                          onPressed: () {
                            _buttonTap(context);
                          },
                        ),
                      );

                      return state.when(
                        initial: () => button,
                        loading: () => const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                        error: (_) => button,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
