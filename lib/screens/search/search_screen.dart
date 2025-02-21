import 'package:flutter/material.dart';

import 'package:dhvanika/widgets/appbar_main.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(
        title: 'Search',
      ),
    );
  }
}
