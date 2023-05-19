// Flutter
import 'package:flutter/material.dart';

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
            'Por favor, trata de que tu rosotro se encuentre en el centro de la pantalla.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: Lottie.network(
                'https://assets6.lottiefiles.com/packages/lf20_Sb1gLg.json'),
          ),
          OutlinedButton(
            onPressed: () {
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
