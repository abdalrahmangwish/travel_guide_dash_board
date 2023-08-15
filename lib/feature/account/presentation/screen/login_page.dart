import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_guide_dashborad/core/utils/utils.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/presentation/blocs/login_cubit/login_cubit.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/presentation/widget/login_body.dart';
import 'package:flutter_travel_guide_dashborad/feature/main_page/presentation/pages/slide_menu.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 50.0,
        ),
      ),
      child: BlocProvider(
        create: (context) => LoginCubit(),
        child: Builder(
          builder: (context) {
            return BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                switch (state.runtimeType) {
                  case LoginLoading:
                    context.loaderOverlay.show();
                    break;
                  case LoginLoaded:
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SideMenuTravelGuide(),
                      ),
                      (route) => false,
                    );
                    context.loaderOverlay.hide();
                    break;
                  case LoginError:
                    Utils.showCustomToast("enter valid email and password");
                    context.loaderOverlay.hide();
                    break;
                }
              },
              child: Scaffold(
                body: LoginBody(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
