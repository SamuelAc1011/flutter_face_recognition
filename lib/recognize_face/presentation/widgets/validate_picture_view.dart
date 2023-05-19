// Flutter
import 'dart:io';
import 'package:flutter/material.dart';

// Package
import 'package:flutter_bloc/flutter_bloc.dart';

// Import
import 'package:face_recognition/recognize_face/presentation/manager/blocs/camera/camera_bloc.dart';

class ValidatePictureView extends StatelessWidget {
  // Constructor
  const ValidatePictureView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: BlocBuilder<CameraBloc, CameraState>(
            builder: (context, state) {
              return Image.file(
                File(state.imagePath),
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
              );
            },
          ),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              'main_screen',
              (route) => false,
            );
          },
          child: const Text('Validate'),
        ),
      ],
    );
  }
}
