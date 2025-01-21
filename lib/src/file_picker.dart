import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:flutter/material.dart';

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
        child: Container(
          child: ElevatedButton(onPressed: pickFile, child: Text("Click")),
        ),
      ),
    );
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      print(file.path);
    } else {
      print("No such file selected");
    }
  }
}
