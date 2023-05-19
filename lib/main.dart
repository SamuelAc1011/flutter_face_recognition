// Flutter
import 'package:face_recognition/recognize_face/presentation/manager/blocs/camera/camera_bloc.dart';
import 'package:flutter/material.dart';

// Package
import 'package:flutter_bloc/flutter_bloc.dart';

// Import
import 'package:face_recognition/recognize_face/presentation/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyAppState());
}

class MyAppState extends StatelessWidget {
  // Constructor
  const MyAppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CameraBloc()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  // Constructor
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'main_screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
      ),
      routes: {
        'main_screen': (_) => const HomeScreen(),
      },
    );
  }
}
