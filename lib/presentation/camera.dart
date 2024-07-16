import 'package:camera/camera.dart';
import 'package:eye_distance/logic/camera_cubit.dart';
import 'package:eye_distance/logic/camera_state.dart';
import 'package:eye_distance/presentation/widgets/cstm_camera_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.read<CameraCubit>().disposeCamera();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
        ),
        body: BlocBuilder<CameraCubit, CameraState>(
          builder: (context, state) {
            if (state is CameraLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            } else if (state is CameraError) {
              return const Center(
                child: Text(
                  'Failed to load camera, please try again',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else if (state is CameraLoaded) {
              CameraController camera =
                  context.read<CameraCubit>().camera;
              return camera.value.isInitialized == true
                  ? Stack(
                children: [
                  SizedBox(
                    height: height,
                    width: width,
                    child: CameraPreview(
                      camera,
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 150,),
                        Expanded(
                          child: Column(
                            children: [
                              CustomPaint(
                                foregroundPainter: BorderPainter(),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.75,
                                  height: MediaQuery.sizeOf(context).height * 0.175,
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              )
                  : const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
