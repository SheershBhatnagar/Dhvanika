import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dhvanika/blocs/auth/auth_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(SignOutRequested());
            },
            child: Text(
              'Logout'
            ),
          ),
        ],
      ),
    );
  }
}
