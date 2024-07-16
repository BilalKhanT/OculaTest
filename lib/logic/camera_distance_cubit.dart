import 'package:bloc/bloc.dart';
import 'camera_distance_state.dart';

class CameraDistanceCubit extends Cubit<CameraDistanceState> {
  CameraDistanceCubit() : super(CameraDistanceInitial());

  Future<void> updateDistance(double distance) async {
    emit(CameraDistanceInitial());
    emit(CameraDistanceChanged(distance));
  }
}
