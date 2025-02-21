import 'package:flutter/material.dart';

import 'package:dhvanika/screens/search/search_screen.dart';
import 'package:dhvanika/screens/upload/upload_screen.dart';
import 'package:dhvanika/utils/strings.dart';

class AppBarMain extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  const AppBarMain({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Strings strings = Strings();

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UploadScreen()));
          },
          icon: Icon(
            Icons.file_upload_outlined,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
          },
          icon: Icon(
            Icons.search_rounded,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
