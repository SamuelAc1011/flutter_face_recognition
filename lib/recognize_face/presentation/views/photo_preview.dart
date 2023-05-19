import 'dart:io';
import 'package:flutter/material.dart';

class PhotoPreviewScreen extends StatelessWidget {
  // Constructor
  const PhotoPreviewScreen({Key? key, required this.imagePath}) : super(key: key);

  // Attributes
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: Image.file(
                File(imagePath),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ));
  }
}