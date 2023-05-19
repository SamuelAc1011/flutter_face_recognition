part of 'camera_bloc.dart';

abstract class CameraEvent extends Equatable {
  const CameraEvent();
}

class TakePicture extends CameraEvent {
  @override
  List<Object> get props => [];
}