import 'package:eye_distance/logic/camera_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProvideMultiBloc extends StatelessWidget {
  final Widget child;

  const ProvideMultiBloc({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => CameraCubit(),
      ),
    ], child: child);
  }
}
