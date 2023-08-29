// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_it/auth/bloc/auth_bloc.dart';
import 'package:post_it/core/service/api_service.dart';
import 'package:post_it/core/service/pick_image_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'home/application/bloc/home_bloc.dart';
import 'splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ApiService(pref),
        ),
        RepositoryProvider(
          create: (context) => PickImageService(imagePicker: ImagePicker()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.read<ApiService>()),
          ),
          BlocProvider(
            create: (context) => HomeBloc(
              apiService: context.read<ApiService>(),
              PickImageService(imagePicker: ImagePicker()),
            )..add(const HomeApiCallEvent()),
          ),
        ],
        child: AppWidget(
          sharedPreferences: pref,
        ),
      ),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purpleAccent,
      ),
      home: SplashScreen(
        sharedPreferences: sharedPreferences,
      ),
    );
  }
}
