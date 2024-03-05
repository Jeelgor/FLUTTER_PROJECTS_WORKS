import 'dart:io';

import 'package:flutter/material.dart';
import 'package:locker/login_screen.dart';
import 'package:locker/photo_selection_screen.dart';

class PhotoGalleryScreen extends StatefulWidget {
  @override
  _PhotoGalleryScreenState createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  List<String> selectedPhotos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selected Photos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Display selected photos
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: selectedPhotos.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle tapping on an image (e.g., open in full screen)
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
                _navigateToPhotoSelection();
              },
              child: Text('Add Photos'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _lockPhotos();
              },
              child: Text('Lock Photos'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPhotoSelection() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PhotoSelectionScreen(
                userId: '',
              )),
    );

    if (result != null && result is List<String>) {
      setState(() {
        selectedPhotos.addAll(result);
      });
    }
  }

  void _lockPhotos() {
    print('Locking photos: $selectedPhotos');
    // Implement the logic to lock or secure selected photos
    // For simplicity, we are just printing the selected photo paths for now
    // You can add further logic to encrypt or store these paths securely
  }
}
