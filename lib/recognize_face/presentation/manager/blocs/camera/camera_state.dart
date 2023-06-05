part of 'camera_bloc.dart';

enum Status { initial, loaded, takingPhoto, failure }

class CameraState extends Equatable {
  // Constructor
  const CameraState({
    this.status = Status.initial,
    this.imagePath = '',
  });

  // Attributes
  final Status status;
  final String imagePath;

  @override
  // Method:
  List<Object?> get props => [status, imagePath];

  // Method: CopyWith
  CameraState copyWith({
    Status? status,
    String? imagePath,
  }) =>
      CameraState(
        status: status ?? this.status,
        imagePath: imagePath ?? this.imagePath,
      );
}
