// Flutter
import 'package:flutter/material.dart';

// Packages
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Imports
import 'package:face_recognition/recognize_face/presentation/manager/blocs/camera/camera_bloc.dart';
import 'package:face_recognition/recognize_face/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  // Constructor
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Variable
    final cameraBloc = context.read<CameraBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text('Take a Picture')),
      body: BlocBuilder<CameraBloc, CameraState>(
        builder: (context, state) {
          return FutureBuilder<void>(
            future: cameraBloc.initializeControllerFuture,
            builder: (context, snapshot) {
              // Condition: Is the Future complete?
              if (snapshot.connectionState == ConnectionState.done) {
                // * Yes => Display the preview
                return CameraPreview(cameraBloc.controller!);
              } else {
                // * No => Display a loading indicator until the controller is initialized
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const PhotoButton(),
    );
  }
}
