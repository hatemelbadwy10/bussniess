import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app_routing/route_names.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/regax.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/widgets/action_button.dart';
import '../../../../core/utils/widgets/input_field.dart';
import '../controller/login_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login Successful")),
              );
              getIt<NavigationService>().navigateTo(RouteNames.verifyLoginScreen);
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 300,
                        child: Image.asset(Assets.login),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Please enter your access information",
                      style: Styles.text18,
                    ),
                    const SizedBox(height: 15),

                    /// Email Input Field
                    InputField(
                      borderColor: AppColors.grey5,
                      borderThickness: 1.8,
                      borderRadius: 4,
                      labelText: "Email",
                      endIcon: Icons.email,
                      inputController: email,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),

                    /// Password Input Field
                    InputField(
                      inputController: password,
                      borderColor: AppColors.grey5,
                      borderThickness: 1.8,
                      borderRadius: 4,
                      labelText: "Password",
                      validator: (String? value) {
                        if (value == null || value.isEmpty || !Regex.moreThan7Char.hasMatch(value)) {
                          return "Password not valid";
                        }
                        return null;
                      },
                      endIcon: Icons.remove_red_eye_outlined,
                    ),
                    const SizedBox(height: 25),

                    /// Login Button
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return ActionButton(
                          text: "Login",
                          textColor: AppColors.whiteBG,
                          bgColor: AppColors.secondary,
                          borderRadius: 25,
                          isLoading: state is LoginLoading,
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            context.read<LoginBloc>().add(
                              Login(
                                email.text.trim(),
                                password.text.trim(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 8),

                    /// Forget Password Button
                    ActionButton(
                      text: "Forget Password",
                      textColor: AppColors.textColor,
                      bgColor: AppColors.whiteBG,
                      borderThickness: 1.8,
                      borderColor: AppColors.grey5,
                      borderRadius: 25,
                      onPressed: () {
                        // Handle forget password
                      },
                    ),
                    const SizedBox(height: 50),

                    /// Footer Text
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Powered by 8WORX",
                        style: Styles.text13Bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
