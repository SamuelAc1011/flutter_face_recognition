// Packages
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';

// Imports
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

part 'camera_event.dart';

part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  // Variables
  CameraController? controller;
  Future<void>? initializeControllerFuture;
  final faceDetector = FaceDetector(options: FaceDetectorOptions());

  CameraBloc() : super(const CameraState()) {
    // Action: Initialize Camera when the bloc is created
    initializeCamera();

    // Event: Take a photo
    on<TakePicture>((event, emit) async {
      emit(state.copyWith(status: Status.takingPhoto));
      try {
        await initializeControllerFuture;
        final image = await controller!.takePicture();

        // Action: Detect all faces in the image
        final faces = await faceDetector
            .processImage(InputImage.fromFilePath(image.path));

        // Condition: Is there any face in the image?
        if (faces.isEmpty) {
          emit(state.copyWith(imagePath: image.path, status: Status.failure));
          return;
        }

        emit(state.copyWith(imagePath: image.path, status: Status.loaded));
      } catch (e) {
        emit(state.copyWith(status: Status.failure));
      }
    });

    // Event: Initialize Camera View
    on<InitCameraView>((event, emit) async {
      emit(state.copyWith(status: Status.loaded));
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
    add(InitCameraView());
  }
}
