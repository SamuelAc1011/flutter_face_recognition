import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:face_recognition/recognize_face/presentation/manager/blocs/camera/camera_bloc.dart';
import 'package:face_recognition/recognize_face/presentation/views/views.dart';

class PhotoButton extends StatelessWidget {
  // Constructor
  const PhotoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Variable
    final cameraBloc = context.read<CameraBloc>();

    return FloatingActionButton(
      onPressed: () async {
        // Action: Take a picture
        cameraBloc.add(TakePicture());
        
        // Action: Navigate to the preview screen
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PhotoPreviewScreen(),
          ),
        );
      },
      child: const Icon(Icons.camera),
    );
  }
}
