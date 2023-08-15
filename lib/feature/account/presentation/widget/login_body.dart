import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/constant.dart';
import 'package:flutter_travel_guide_dashborad/core/global_widget/global_widget.dart';
import 'package:flutter_travel_guide_dashborad/core/responsive/responsive.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/login_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/presentation/blocs/login_cubit/login_cubit.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    required this.emailController,
    required this.passwordController,
    Key? key,
  }) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(gradient: Constant.primaryBodyColor),
      child: Center(
        child: Container(
          width: Responsive.isMobile(context) == true
              ? MediaQuery.of(context).size.width * 0.9
              : MediaQuery.of(context).size.width * 0.7,
          height: Responsive.isMobile(context) == true
              ? MediaQuery.of(context).size.height * 0.9
              : MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            children: [
              if (!Responsive.isMobile(context))
                Center(
                  child: Image(
                    image: const AssetImage('assets/images/222.png'),
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                  ),
                ),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (Responsive.isMobile(context))
                            Center(
                              child: Image(
                                image:
                                    const AssetImage('assets/images/222.png'),
                                width: size.width * 0.4,
                                height: size.width * 0.4,
                              ),
                            ),
                          const Text(
                            "Login",
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextField(
                              width: MediaQuery.of(context).size.width,
                              type: TextInputType.text,
                              prefix: const Icon(Icons.email),
                              controllerName: emailController,
                              label: "email",
                              validate: (String val) {
                                if (val.isEmpty) {
                                  return 'email must be not Empty';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextField(
                              width: MediaQuery.of(context).size.width,
                              type: TextInputType.text,
                              prefix: const Icon(Icons.password_rounded),
                              controllerName: passwordController,
                              label: "Password",
                              validate: (String val) {
                                if (val.isEmpty) {
                                  return 'password must be not Empty';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 30.0,
                          ),
                          CustomBottom(
                            width: MediaQuery.of(context).size.width * 0.3,
                            text: "Login",
                            height: 50,
                            buttonColor: Colors.green,
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                context.read<LoginCubit>().login(
                                      LoginParamsModel(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              }
                            },
                            borderColor: Colors.black54,
                            textStyleForButton:
                                const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
