import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';

part 'camera_event.dart';

part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  // Variables
  CameraController? controller;
  Future<void>? initializeControllerFuture;

  CameraBloc() : super(const CameraState()) {
    // Action: Initialize Camera when the bloc is created
    initializeCamera();

    // Event: Take a photo
    on<TakePicture>((event, emit) async {
      try {
        await initializeControllerFuture;
        final image = await controller!.takePicture();
        emit(state.copyWith(imagePath: image.path, status: Status.loaded));
      } catch (e) {
        emit(state.copyWith(status: Status.failure));
      }
    });
  }

  // Method: Initialize Camera Controller
  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
    );

    controller = CameraController(
      frontCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    initializeControllerFuture = controller!.initialize();
  }
}
