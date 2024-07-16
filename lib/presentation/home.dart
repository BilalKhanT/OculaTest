import 'package:eye_distance/logic/camera_cubit.dart';
import 'package:eye_distance/presentation/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<CameraCubit>().initializeCamera();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CameraView()));
      }),
    );
  }
}
