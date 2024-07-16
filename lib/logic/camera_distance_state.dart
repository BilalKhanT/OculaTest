import 'package:equatable/equatable.dart';

abstract class CameraDistanceState extends Equatable {
  const CameraDistanceState();

  @override
  List<Object?> get props => [];
}

class CameraDistanceInitial extends CameraDistanceState {}

class CameraDistanceChanged extends CameraDistanceState {
  final double distance;

  const CameraDistanceChanged(this.distance);

  @override
  List<Object?> get props => [distance];
}
