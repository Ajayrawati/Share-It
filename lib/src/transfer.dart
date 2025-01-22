import 'dart:io'; // Required for File class
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Transfer extends StatefulWidget {
  final List<PlatformFile> files;
  const Transfer({super.key, required this.files});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transfer Screen")),
      body: ListView.builder(
        itemCount: widget.files.length,
        itemBuilder: (context, index) {
          PlatformFile file = widget.files[index];

          // Check if the file is an image
          bool isImage = file.extension == 'jpg' ||
              file.extension == 'png' ||
              file.extension == 'jpeg';

          return ListTile(
            leading: isImage
                ? Image.file(
                    File(file.path!), // Display image
                    width: 50, // Thumbnail size
                    height: 50,
                    fit: BoxFit.cover,
                  )
                : Icon(Icons.insert_drive_file,
                    size: 40, color: Colors.blue), // Show file icon

            title: Text(file.name), // Show file name
            subtitle: Text("${file.size} bytes"), // Show file size
          );
        },
      ),
    );
  }
}
