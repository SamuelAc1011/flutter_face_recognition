// Flutter
import 'package:face_recognition/recognize_face/presentation/manager/blocs/camera/camera_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Package
import 'package:lottie/lottie.dart';

class FailureMessage extends StatelessWidget {
  // Constructor
  const FailureMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Por favor, trata de que tu rostro se encuentre en el centro de la pantalla.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: Lottie.asset('assets/lotties/face_scan.json'),
          ),
          OutlinedButton(
            onPressed: () {
              final cameraBloc = context.read<CameraBloc>();
              cameraBloc.add(InitCameraView());
              Navigator.of(context).pushNamedAndRemoveUntil(
                'main_screen',
                (route) => false,
              );
            },
            child: const Text(
              'Reintentar',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
