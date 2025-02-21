import 'dart:io';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:dhvanika/widgets/appbar_main.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {

  bool isUploading = false;
  String? downloadUrl;

  Future<void> uploadMusicFile() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: [
        'aac',
        'aiff',
        'avi',
        'flac',
        'mov',
        'mp3',
        'mp4',
        'mpeg',
        'mpg',
        'mpv',
        'ogv',
        'ogg',
        'wav',
        'webm',
      ]
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileName = result.files.single.name;

      for (PlatformFile file in result.files) {
        File musicFile = File(file.path!);
        String fileName = file.name;

        try {
          setState(() {
            isUploading = true;
          });

          Reference storageRef = FirebaseStorage.instance.ref().child('songs/$fileName');
          UploadTask uploadTask = storageRef.putFile(musicFile);

          TaskSnapshot snapshot = await uploadTask;
          String fileUrl = await snapshot.ref.getDownloadURL();

          print(fileUrl);

          print("File Uploaded: $fileUrl");
        } catch (e) {
          print("Error uploading file: $e");
          setState(() {
            isUploading = false;
          });
        }
      }
    }

    setState(() {
      isUploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(
        title: 'Upload',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isUploading ? CircularProgressIndicator() : Container(),
            ElevatedButton(
              onPressed: uploadMusicFile,
              child: Text('Select and Upload Music'),
            ),
            if (downloadUrl != null)
              Text('Uploaded: $downloadUrl', textAlign: TextAlign.center),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
