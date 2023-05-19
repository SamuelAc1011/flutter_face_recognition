import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';

part 'camera_event.dart';

part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  // Variables
  CameraController? controller;
  Future<void>? initializeControllerFuture;

  CameraBloc() : super(CameraState()) {
    initializeCamera();

    on<CameraEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  // Method: Initialize Camera
  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    controller = CameraController(
      frontCamera,
      ResolutionPreset.high,
    );
    initializeControllerFuture = controller!.initialize();
  }
}
