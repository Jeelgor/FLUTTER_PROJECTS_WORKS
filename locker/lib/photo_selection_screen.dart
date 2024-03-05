import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class PhotoSelectionScreen extends StatefulWidget {
  final String userId;

  PhotoSelectionScreen({required this.userId});

  @override
  _PhotoSelectionScreenState createState() => _PhotoSelectionScreenState();
}

class _PhotoSelectionScreenState extends State<PhotoSelectionScreen> {
  List<String> selectedPhotos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Photos'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _pickPhoto();
            },
            child: Text('Pick Photo'),
          ),
          SizedBox(height: 16),
          Text(
            'Selected Photos:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          // Display selected photos using GridView.builder
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns in the grid
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: selectedPhotos.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // You can add additional functionality here, such as viewing the image in full screen
                  },
                  child: Card(
                    child: Image.file(
                      File(selectedPhotos[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Return the selected photos to the photo gallery screen
              Navigator.pop(context, selectedPhotos);
            },
            child: Text('Done'),
          ),
        ],
      ),
    );
  }

  // Helper method to pick a photo using image_picker
  void _pickPhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();

      // Print information for debugging
      print('Application Documents Directory: ${appDir.path}');
      print('User ID: ${widget.userId}');

      final newImagePath =
          '${appDir.path}/user_${widget.userId}/${DateTime.now().millisecondsSinceEpoch}.png';

      // Print the constructed path for debugging
      print('New Image Path: $newImagePath');

      await File(pickedFile.path).copy(newImagePath);

      setState(() {
        selectedPhotos.add(newImagePath);
      });
    }
  }
}
