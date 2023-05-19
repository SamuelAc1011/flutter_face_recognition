import 'dart:io';
import 'package:face_recognition/recognize_face/presentation/manager/blocs/camera/camera_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoPreviewScreen extends StatelessWidget {
  // Constructor
  const PhotoPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: BlocBuilder<CameraBloc, CameraState>(
            builder: (context, state) {
              switch (state.status) {
                // Situation: The camera has a image path ready to display
                case Status.loaded:
                  return Image.file(
                    File(state.imagePath),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  );
                // Situation: The camera has failed to save the image
                case Status.failure:
                  return const FailureMessage();
                // Situation: The camera has an unknown status
                default:
                  return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    ));
  }
}

class FailureMessage extends StatelessWidget {
  const FailureMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          children: [
            const Text(
              'Failed to load image',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PhotoPreviewScreen(),
                  ),
                );
              },
              child: const Text(
                'Retry',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
