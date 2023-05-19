// Flutter
import 'package:camera/camera.dart';
import 'package:face_recognition/recognize_face/presentation/manager/blocs/camera/camera_bloc.dart';
import 'package:face_recognition/recognize_face/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  // Constructor
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cameraBloc = BlocProvider.of<CameraBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Take a Picture')),
      body: BlocBuilder<CameraBloc, CameraState>(
        builder: (context, state) {
          return FutureBuilder<void>(
            future: cameraBloc.initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(cameraBloc.controller!);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final cameraBloc = BlocProvider.of<CameraBloc>(context);
          await cameraBloc.initializeControllerFuture;
          final image = await cameraBloc.controller!.takePicture();

          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PhotoPreviewScreen(
                imagePath: image.path,
              ),
            ),
          );
        },
        child: const Icon(Icons.camera),
      ),
    );
  }
}


