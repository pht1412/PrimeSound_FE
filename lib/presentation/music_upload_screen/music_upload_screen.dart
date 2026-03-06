import 'package:flutter/material.dart';

class MusicUploadScreen extends StatelessWidget {
  const MusicUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Music'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.music_note, size: 80, color: Colors.grey),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Handle pick audio file logic
              },
              icon: const Icon(Icons.cloud_upload),
              label: const Text('Select Audio File'),
            ),
          ],
        ),
      ),
    );
  }
}