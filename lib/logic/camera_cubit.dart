import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:eye_distance/logic/camera_state.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraInitial());

  CameraController? camera;
  late List<CameraDescription> cameras;
  FaceDetector? faceDetector;
  List<Face>? facesList;

  void disposeCamera() {
    camera?.dispose();
    faceDetector?.close();
  }

  Future<void> initializeCamera() async {
    emit(CameraLoading());
    try {
      cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );
      camera = CameraController(
        frontCamera,
        ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.yuv420,
        enableAudio: false,
      );
      await camera?.initialize();
      await camera?.setFlashMode(FlashMode.off);
      await camera?.setFocusMode(FocusMode.auto);
      faceDetector = FaceDetector(
          options: FaceDetectorOptions(
        performanceMode: FaceDetectorMode.accurate,
        enableLandmarks: true,
        enableClassification: true,
      ));
      emit(CameraLoaded(camera!));
    } catch (e) {
      log(e.toString());
      emit(const CameraError('Failed to load camera'));
    }
  }
}
