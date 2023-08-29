import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_it/auth/bloc/auth_bloc.dart';
import 'package:post_it/home/presentation/home_screen.dart';
import 'package:rive/rive.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Artboard? riveArtboard;
  SMIBool? isDance;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/dash_flutter_muscot.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(artboard, 'birb');
        if (controller != null) {
          artboard.addController(controller);
          isDance = controller.findSMI('dance');
        }
        setState(() => riveArtboard = artboard);
      },
    );
  }

  void startDancing() {
    if (isDance != null) {
      setState(() {
        isDance!.value = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => const HomeScreen()),
              ),
            );
          }
          if (state.status == AuthStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Oops Something Went Wrong....')));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    authBloc.add(AuthStartEvent());
                    startDancing();
                  },
                  child: riveArtboard == null
                      ? const SizedBox()
                      : Rive(
                          artboard: riveArtboard!,
                        ),
                ),
              ),
              const Text('Tap Me To Proceed.....')
            ],
          ),
        ),
      ),
    );
  }
}
