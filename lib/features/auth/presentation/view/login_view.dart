import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/regax.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/widgets/action_button.dart';
import '../../../../core/utils/widgets/input_field.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}
final email = TextEditingController();
final password = TextEditingController();
final _formKey = GlobalKey<FormState>();
class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                        child: Image.asset(Assets.login)),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Plesae enter your access information",
                    style: Styles.text18,
                  ),
                  const SizedBox(height: 15),
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
                      } else
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  InputField(
                    inputController: password,
                    borderColor: AppColors.grey5,
                    borderThickness: 1.8,
                    borderRadius: 4,
                    labelText: "Password",
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          !Regex.moreThan7Char.hasMatch(value)) {
                        return "Password not valid";
                      }
                      return null;
                    },
                    endIcon: Icons.remove_red_eye_outlined,
                  ),
                  const SizedBox(height: 25),
                  ActionButton(
                    text: "Login",
                    textColor: AppColors.whiteBG,
                    bgColor: AppColors.secondary,
                    borderRadius: 25,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;

                    },
                  ),
                  // const SizedBox(height: 8),
                  // ActionButton(
                  //   text: "Face ID Login",
                  //   textColor: AppColors.whiteBG,
                  //   bgColor: AppColors.green,
                  //   borderRadius: 25,
                  //   onPressed: () {
                  //     if (isLoading) return;
                  //   },
                  // ),
                  const SizedBox(height: 8),
                  ActionButton(
                    text: "Forget Password",
                    textColor: AppColors.textColor,
                    bgColor: AppColors.whiteBG,
                    borderThickness: 1.8,
                    borderColor: AppColors.grey5,
                    borderRadius: 25,
                    onPressed: () {

                    },
                  ),
                  const SizedBox(height: 50),
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
          )
        ),
      ),
    );
  }
}
