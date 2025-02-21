import 'package:dhvanika/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hi, Welcome Back 👋',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 50),

            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextFormField(
              autofocus: true,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.key,
                  color: Colors.black,
                ),
                suffixIcon: Icon(
                  Icons.remove_red_eye_rounded,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 10),

            TextButton(
              onPressed: () {},
              child: Text('Forgot Password?'),
            ),

            const SizedBox(height: 40),

            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
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
                      'Login',
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text('Don\'t have an account? SignUp'),
            ),
          ],
        ),
      ),
    );
  }
}
