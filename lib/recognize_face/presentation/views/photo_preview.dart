// Flutter
import 'package:flutter/material.dart';

// Packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

// Imports
import 'package:face_recognition/recognize_face/presentation/manager/blocs/camera/camera_bloc.dart';
import 'package:face_recognition/recognize_face/presentation/widgets/widgets.dart';

class PhotoPreviewScreen extends StatelessWidget {
  // Constructor
  const PhotoPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: BlocBuilder<CameraBloc, CameraState>(
            builder: (context, state) {
              switch (state.status) {
                // Situation: The camera has a image path ready to display
                case Status.loaded:
                  return const ValidatePictureView();
                // Situation: The camera has failed to save the image
                case Status.failure:
                  return const FailureMessage();
                case Status.takingPhoto:
                  return Lottie.network(
                      'https://assets6.lottiefiles.com/packages/lf20_iwcaeitq.json');
                // Situation: The camera has an unknown status
                default:
                  return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
