import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/src/transfer.dart';

class FlutterDemoFilePicker extends StatefulWidget {
  const FlutterDemoFilePicker({super.key});

  @override
  State<FlutterDemoFilePicker> createState() => _FlutterDemoFilePickerState();
}

class _FlutterDemoFilePickerState extends State<FlutterDemoFilePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Picker"),
      ),
      body: Center(
        child: IconButton(
          onPressed: pickFile,
          icon: Image.asset(
            'images/59966.jpg', // Ensure this image is in assets folder
            width: 40, // Adjusted size
            height: 40,
          ),
        ),
      ),
    );
  }

  Future<void> pickFile() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      print("Granted");

      FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: true);

      if (result != null && result.files.isNotEmpty) {
        // Navigate only if files are selected
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Transfer(files: result.files)),
        );
      } else {
        print("No file selected");
      }
    } else {
      print("Storage Permission Denied");
    }
  }
}
