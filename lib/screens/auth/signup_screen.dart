import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:dhvanika/blocs/auth/auth_bloc.dart';
import 'package:dhvanika/screens/home_screen.dart';
import 'package:dhvanika/screens/auth/login_screen.dart';
import 'package:dhvanika/widgets/textfield_widget.dart';
import 'package:dhvanika/utils/assets.dart';
import 'package:dhvanika/screens/auth/email_confirmation_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final signupFormKey = GlobalKey<FormState>();

  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    fNameController.dispose();
    lNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {

          if (state is Authenticated) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
          }

        },

        builder: (context, state) {

          if (state is AuthLoading) {
            return Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: Lottie.asset(Assets.loading),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Form(
              key: signupFormKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create an Account 🥳',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 50),

                  Row(
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          controller: fNameController,
                          hintText: 'First Name',
                          inputType: TextInputType.name,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter first name';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: TextFieldWidget(
                          controller: lNameController,
                          hintText: 'Last Name',
                          inputType: TextInputType.name,
                          prefixIcon: Icon(
                            Icons.group,
                            color: Colors.black,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter last name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  TextFieldWidget(
                    controller: emailController,
                    hintText: 'Email',
                    inputType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  TextFieldWidget(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    prefixIcon: Icon(
                      Icons.key,
                      color: Colors.black,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_rounded,
                      color: Colors.black,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }

                      if (value.length < 8) {
                        return 'Password should be at least 8 characters';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  TextFieldWidget(
                    controller: cPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                    prefixIcon: Icon(
                      Icons.key,
                      color: Colors.black,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_rounded,
                      color: Colors.black,
                    ),
                    validator: (value) {
                      if (value != passwordController.text.toString().trim()) {
                        return 'Password doesn\'t matched!';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (signupFormKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(CreateAccountRequested(
                            email: emailController.text.toString().trim(),
                            password: passwordController.text.toString().trim(),
                          ));
                        }
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => EmailConfirmationScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => LoginScreen()));
                    },
                    child: Text('Already have an account? SignIn'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
