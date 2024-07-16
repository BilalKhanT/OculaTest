import 'package:eye_distance/logic/camera_cubit.dart';
import 'package:eye_distance/logic/camera_state.dart';
import 'package:eye_distance/presentation/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
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
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        Text('Rules',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),),
                        SizedBox(height: 5.0,),
                        Text('(1): Keep your phone at a still position.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),),
                        Text('(2): Move away from phone once you are at ideal distance test will start.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),),
                        Text('(3): Stay at the same distance throughout the test.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is CameraSuccess) {
              context.read<CameraCubit>().disposeCamera();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TestView()));
              return const SizedBox.shrink();
            }else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
